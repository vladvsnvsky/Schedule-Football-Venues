using AutoMapper;
using Microsoft.AspNetCore.SignalR;
using MinifootballAppApi.DTOs;
using MinifootballAppApi.DTOs.Create;
using MinifootballAppApi.DTOs.Filters;
using MinifootballAppApi.DTOs.Update;
using MinifootballAppApi.Exceptions;
using MinifootballAppApi.Hubs;
using MinifootballAppApi.Models;
using MinifootballAppApi.Repository.Interface;
using MinifootballAppApi.Services.Interface;
using MinifootballAppApi.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MinifootballAppApi.Services
{
    public class MatchService : IMatchService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;
        private readonly IHubContext<GameHub> _hubContext;

        public MatchService(IHubContext<GameHub> hubContext, IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
            _hubContext = hubContext;
        }

        public async Task CreateAsync(CreateMatchDTO matchDTO)
        {
            try
            {
                var organizerId = matchDTO.OrganizerId;
                var organizerEntity = await _unitOfWork.UserRepository.GetById(organizerId);

                if (organizerEntity.IsBanned == true)
                {
                    throw new Exception("You've been temporarly banned. You cannot create or join a game right now!");
                }

                Match match = _mapper.Map<Match>(matchDTO);

                match.StartTime = new DateTime(matchDTO.StartYear, matchDTO.StartMonth, matchDTO.StartDay, matchDTO.StartHour, 0, 0);
                match.EndTime = new DateTime(matchDTO.EndYear, matchDTO.EndMonth, matchDTO.EndDay, matchDTO.EndHour, 0, 0);

                TimeSpan difference = match.StartTime - DateTime.Now;
                if (difference.TotalHours < 24)
                    throw new Exception("There must be more than 24 hours until the game starts!");


                if (match.EndTime < match.StartTime)
                    throw new Exception("The end of the game must be after the start of the game!");

                match.PlayerCanJoin = match.NrOfPlayersRequired > 0;

                var startTime = match.StartTime;
                var endTime = match.EndTime;
                var fieldId = match.FieldId;

                
                var overlappingMatches = await _unitOfWork.MatchRepository.GetByFieldIdAndTimeRangeAsync(fieldId, startTime, endTime);

                if (overlappingMatches.Any(m => !m.Cancelled))
                {
                    throw new Exception("There is already a game scheduled for this field at the chosen time.");
                }

                UserEntity user = await _unitOfWork.UserRepository.GetById(organizerId);

                if(user.BudgetUnits < match.PricePerPlayerUnits)
                {
                    throw new Exception("You don't have enough money to join this game!");
                }

                UserMatch userMatch = new UserMatch
                {
                    Match = match,
                    PlayerId = organizerId
                };



                match.Players.Add(userMatch);
                match.PricePerPlayerUnits = matchDTO.PricePerPlayerUnits;
                match.CancelledReason = null;
                match.MatchBudgetUnits += match.PricePerPlayerUnits;
                user.BudgetUnits -= match.PricePerPlayerUnits;
                await _unitOfWork.UserRepository.UpdateAsync(user);
                await _unitOfWork.MatchRepository.CreateAsync(match);
                await _unitOfWork.CompleteAsync();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public async Task<ICollection<MatchDTO>> GetAllAsync()
        {
            var matches = await _unitOfWork.MatchRepository.GetAllMatches();
            var matchesDTO = matches.Select(ToMatchDTO).ToList();
            return matchesDTO;
        }

        public async Task<ICollection<GameDetailsDTO>> GetAllActiveAsync()
        {
            var matches = await _unitOfWork.MatchRepository.GetAllMatches();
            var matchesDTO = matches.Where(item => !item.Cancelled && !item.Finished)
                                    .Select(ConvertToMatchDetails)
                                    .ToList();
            return matchesDTO;
        }

        public async Task<ICollection<GameDetailsDTO>> GetAllActiveByCityAsync(int cityId)
        {
            var matches = await _unitOfWork.MatchRepository.GetMatchesByCity(cityId);
            var matchesDTO = matches.Where(item => !item.Cancelled && !item.Finished)
                                    .Select(ConvertToMatchDetails)
                                    .ToList();
            return matchesDTO;
        }

        public async Task<ICollection<GameDetailsDTO>> GetAllActiveByFieldAsync(int fieldId)
        {
            var matches = await _unitOfWork.MatchRepository.GetMatchesByField(fieldId);
            var matchesDTO = matches.Where(item => !item.Cancelled && !item.Finished)
                                    .Select(ConvertToMatchDetails)
                                    .ToList();
            return matchesDTO;
        }

        private GameDetailsDTO ConvertToMatchDetails(Match match)
        {
            return _mapper.Map<GameDetailsDTO>(match);
        }

        public async Task MarkAsFinished(int matchId)
        {
            var match = await _unitOfWork.MatchRepository.GetAsync(matchId);
            if (match == null)
                throw new Exception("Match not found!");
            match.Finished = true;
            await _unitOfWork.MatchRepository.UpdateAsync(match);
            await _unitOfWork.CompleteAsync();
        }

        public async Task MarkAsFinished(Match match)
        {
            match.Finished = true;
            await _unitOfWork.MatchRepository.UpdateAsync(match);
            await _unitOfWork.CompleteAsync();
        }

        public async Task RefreshJob(string jobType, string startTie)
        {
            await RefreshMatchTableState();
        }

        public async Task RefreshMatchTableState()
        {
            try
            {
                var matches = await _unitOfWork.MatchRepository.GetAllActiveMatches();
                foreach (var match in matches)
                {
                    if (!match.Cancelled && !match.Finished)
                    {
                        DateTime currentTime = DateTime.Now;
                        DateTime matchStartTime = match.StartTime;

                        TimeSpan difference = matchStartTime - currentTime;

                        if (difference.TotalHours < 24 && match.CurrentNumberOfPlayers < match.NrOfPlayersRequired)
                        {
                            match.Cancelled = true;
                            match.CancelledReason = "Match cancelled because not enough players were found within 24 hours before the game.";
                            match.Finished = true;
                            match.PlayerCanJoin = false;
                            await _unitOfWork.MatchRepository.UpdateAsync(match);
                            await _unitOfWork.CompleteAsync();
                            return;
                        }
                        var endTime = match.EndTime;
                        if (currentTime >= endTime)
                        {
                            match.Finished = true;
                            match.Field.BudgetUnits += match.MatchBudgetUnits;
                            await _unitOfWork.FieldRepository.UpdateAsync(match.Field);
                            await _unitOfWork.CompleteAsync();
                            return;
                        }
                        
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<MatchDTO> GetByIdAsync(int id)
        {
            var result = await _unitOfWork.MatchRepository.GetMatchById(id);
            if (result == null)
                throw new EntityNotFoundException($"Match with id {id} not found!");
            return ToMatchDTO(result);
        }

        public async Task<ICollection<MatchDTO>> GetMatchesByCity(int cityId)
        {
            var matches = await _unitOfWork.MatchRepository.GetMatchesByCity(cityId);
            var matchesDTO = matches.Select(ToMatchDTO).ToList();
            return matchesDTO;
        }

        #region UPDATE

        public async Task<MatchDTO> UpdateAsync(int id, UpdateMatchDTO dto)
        {
            var oldMatch = await _unitOfWork.MatchRepository.GetAsync(id);

            if (oldMatch == null)
            {
                throw new EntityNotFoundException($"Match with id {id} not found.");
            }

            var newMatch = _mapper.Map<Match>(dto);

            oldMatch.PlayerCanJoin = newMatch.PlayerCanJoin;
            oldMatch.NrOfPlayersRequired = newMatch.NrOfPlayersRequired;
            oldMatch.CancelledReason = newMatch.CancelledReason;
            oldMatch.Cancelled = newMatch.Cancelled;
            oldMatch.StartTime = newMatch.StartTime;
            oldMatch.EndTime = newMatch.EndTime;

            await _unitOfWork.MatchRepository.UpdateAsync(oldMatch);

            return _mapper.Map<MatchDTO>(dto);
        }

        #endregion

        #region DELETE
        public async Task DeleteAsync(int id)
        {
            var match = await _unitOfWork.MatchRepository.GetAsync(id);
            if (match != null)
                await _unitOfWork.MatchRepository.DeleteAsync(match);
            else throw new EntityNotFoundException($"Match with id {id} not found.");
        }

        #endregion

        private MatchDTO ToMatchDTO(Match match)
        {
            return _mapper.Map<MatchDTO>(match);
        }

        public async Task CancelMatch(int matchId, string cancellationReason, int userId)
        {
            try
            {
                var match = await _unitOfWork.MatchRepository.GetMatchById(matchId);
                if (match is null)
                {
                    throw new Exception("Match not found!");
                }

                if(match.Cancelled == true)
                {
                    throw new Exception("This game has beed cancelled already!");
                }

                if (match.Finished == true)
                {
                    throw new Exception("You cannot join a finished game!");
                }

                var admins = await _unitOfWork.UserRepository.GetAdmins();

                bool isAdmin = admins.Any(admin => admin.Id == userId);


                if (match.OrganizerId != userId && isAdmin == false)
                {
                    throw new Exception("You are not allowed to cancel this game because you are not the organizer!");
                }

                DateTime currentTime = DateTime.Now;
                DateTime matchStartTime = match.StartTime;

                TimeSpan difference = matchStartTime - currentTime;

                if (difference.TotalHours < 24)
                {
                    if(isAdmin == false)
                        throw new Exception("You cannot cancel a game with less than 24 hours before the game starts.");
                }

                match.Cancelled = true;
                match.CancelledReason = cancellationReason;
                match.PlayerCanJoin = false;

                var um = await _unitOfWork.UserMatchRepository.GetCurrentPlayers(matchId);

                foreach (var e in um)
                {
                    if (match.PricePerPlayerUnits != null)
                    {
                        e.Player.BudgetUnits += match.PricePerPlayerUnits;
                        await _unitOfWork.UserRepository.UpdateAsync(e.Player);
                        match.MatchBudgetUnits -= match.PricePerPlayerUnits;
                    }

                }

                await _unitOfWork.MatchRepository.UpdateAsync(match);
                await _unitOfWork.CompleteAsync();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task LeaveMatch(int matchId, int playerId)
        {
            try
            {
                var match = await _unitOfWork.MatchRepository.GetMatchById(matchId);

                if (match is null)
                {
                    throw new Exception("Match not found!");
                }

                DateTime currentTime = DateTime.Now;
                DateTime matchStartTime = match.StartTime;

                TimeSpan difference = matchStartTime - currentTime;

                if (difference.TotalHours < 24)
                {
                    throw new Exception("You are not allowed to leave a game less than 24 hours before the game starts.");
                }

                var userPlayers = await _unitOfWork.UserMatchRepository.GetCurrentPlayers(matchId) as List<UserMatch>;

                foreach (var up in userPlayers.ToList())
                {
                    if (up.PlayerId == playerId)
                    {
                        await _unitOfWork.UserMatchRepository.DeleteAsync(up);
                        match.CurrentNumberOfPlayers = (await _unitOfWork.UserMatchRepository.GetCurrentPlayers(matchId) as List<UserMatch>).Count;

                        match.PlayerCanJoin = match.CurrentNumberOfPlayers < match.NrOfPlayersRequired;
                        match.MatchBudgetUnits -= match.PricePerPlayerUnits;
                        up.Player.BudgetUnits += match.PricePerPlayerUnits;

                        await _unitOfWork.UserRepository.UpdateAsync(up.Player);
                        await _unitOfWork.MatchRepository.UpdateAsync(match);
                        await _unitOfWork.CompleteAsync();
                        await _hubContext.Clients.All.SendAsync("PlayerCountUpdated", match.Id, match.CurrentNumberOfPlayers);
                        return;
                    }
                }

                throw new Exception("You cannot leave a game you're not part of!");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task PlayerJoinMatch(int userId, int matchId)
        {
            try
            {
                var match = await _unitOfWork.MatchRepository.GetMatchById(matchId);
                if (match == null)
                    throw new Exception($"Match with id {matchId} not found!");

                if(match.Cancelled == true)
                {
                    throw new Exception($"You cannot join a cancelled game!");
                }

                if (match.PlayerCanJoin == false)
                {
                    throw new Exception("Players can NOT join this game anymore!");
                }

                var user = await _unitOfWork.UserRepository.GetAsync(userId);

                if(user.BudgetUnits < match.PricePerPlayerUnits)
                {
                    throw new Exception("Not enough founds in you account!");
                }

                if (user.IsBanned == true)
                {
                    throw new Exception("You've been temporarly banned! You cannot join or create a game right now!");
                }

                if (userId == match.OrganizerId)
                {
                    throw new Exception("Organizer cannot join its own match");
                }


                DateTime currentTime = DateTime.Now;
                DateTime matchStartTime = match.StartTime;

                TimeSpan difference = matchStartTime - currentTime;

                if (difference.TotalHours < 24)
                {
                    throw new Exception("You are not allowed to join a game less than 24 hours before the game starts.");
                }

                // Check if a player has another game at the same time already scheduled
                var checkOverlappingGames = await _unitOfWork.UserMatchRepository.ExistOverlappingMatchesByPlayerIdAndTimeRangeAsync(userId, match.StartTime, match.EndTime);

                if (checkOverlappingGames)
                {
                    throw new Exception("You already have a game scheduled at that time!");
                }

                UserMatch userMatch = new UserMatch
                {
                    MatchId = matchId,
                    PlayerId = userId
                };

                match.Players = await _unitOfWork.UserMatchRepository.GetCurrentPlayers(matchId) as List<UserMatch>;
                match.Players.Add(userMatch);
                match.MatchBudgetUnits += match.PricePerPlayerUnits;
                user.BudgetUnits -= match.PricePerPlayerUnits;

                await _unitOfWork.UserRepository.UpdateAsync(user);
                match.CurrentNumberOfPlayers++;

                if (match.NrOfPlayersRequired == match.Players.Count)
                    match.PlayerCanJoin = false;

                await _unitOfWork.MatchRepository.UpdateAsync(match);
                await _unitOfWork.CompleteAsync();
                await _hubContext.Clients.All.SendAsync("PlayerCountUpdated", match.Id, match.CurrentNumberOfPlayers);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public async Task<ICollection<GameDetailsDTO>> GetAllByPlayerAsync(int playerId)
        {
            try
            {
                var res = await _unitOfWork.UserMatchRepository.GetMatchesByPlayerId(playerId) as List<Match>;
                var myList = res.Select(ConvertToMatchDetails).ToList();
                return myList;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<PaginatedResponse<GameDetailsDTO>> GetAllActiveByPlayerPaginatorAsync(int playerId, int pageNumber, int pageSize)
        {
            try
            {
                var paginatedMatches = await _unitOfWork.UserMatchRepository.GetMatchesByPlayerIdPaginatedAsync(playerId, pageNumber, pageSize);

                var gameDetailsList = paginatedMatches.Items.Select(ConvertToMatchDetails).ToList();

                return new PaginatedResponse<GameDetailsDTO>
                {
                    Items = gameDetailsList,
                    TotalPages = paginatedMatches.TotalPages,
                    CurrentPage = paginatedMatches.CurrentPage
                };
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<GameDetailsDTO> GetMatchDetailsById(int id)
        {
            try
            {
                var match = await _unitOfWork.MatchRepository.GetMatchById(id);
                if (match != null)
                {
                    return ConvertToMatchDetails(match);
                }
                throw new Exception("Match not found!");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task DeactivateGame(int matchId)
        {
            try
            {
                var match = await _unitOfWork.MatchRepository.GetAsync(matchId);
                if (match != null)
                {
                    match.PlayerCanJoin = true;
                    match.Cancelled = true;
                    match.Finished = true;
                    await _unitOfWork.MatchRepository.UpdateAsync(match);
                    await _unitOfWork.CompleteAsync();
                }
                else
                {
                    throw new Exception("Match not found!");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<PaginatedResponse<GameDetailsDTO>> GetAllByStartTimePaginatorAsync(int pageNumber, int pageSize)
        {
            try
            {
                PaginatedResponse<Match> responseFromDb = await _unitOfWork.MatchRepository.GetAllByStartTimePaginatorAsync(pageNumber, pageSize);
                var myList = responseFromDb.Items.Select(ConvertToMatchDetails).ToList();
                return new PaginatedResponse<GameDetailsDTO>
                {
                    Items = myList,
                    CurrentPage = responseFromDb.CurrentPage,
                    TotalPages = responseFromDb.TotalPages
                };
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<PaginatedResponse<GameDetailsDTO>> GetAllActiveByStartTimePaginatorAsync(int pageNumber, int pageSize)
        {
            try
            {
                PaginatedResponse<Match> responseFromDb = await _unitOfWork.MatchRepository.GetAllActiveByStartTimePaginatorAsync(pageNumber, pageSize);
                var myList = responseFromDb.Items.Select(ConvertToMatchDetails).ToList();
                return new PaginatedResponse<GameDetailsDTO>
                {
                    Items = myList,
                    CurrentPage = responseFromDb.CurrentPage,
                    TotalPages = responseFromDb.TotalPages
                };
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<PaginatedResponse<GameDetailsDTO>> GetAllByGameTypePaginatorAsync(int pageNumber, int pageSize, int nrOfPlayersRequired)
        {
            try
            {
                PaginatedResponse<Match> responseFromDb = await _unitOfWork.MatchRepository.GetAllByGameTypePaginatorAsync(pageNumber, pageSize, nrOfPlayersRequired);
                var myList = responseFromDb.Items.Select(ConvertToMatchDetails).ToList();
                return new PaginatedResponse<GameDetailsDTO>
                {
                    Items = myList,
                    CurrentPage = responseFromDb.CurrentPage,
                    TotalPages = responseFromDb.TotalPages
                };
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<PaginatedResponse<GameDetailsDTO>> GetAllActiveByGameTypePaginatorAsync(int pageNumber, int pageSize, int nrOfPlayersRequired)
        {
            try
            {
                PaginatedResponse<Match> responseFromDb = await _unitOfWork.MatchRepository.GetAllActiveByGameTypePaginatorAsync(pageNumber, pageSize, nrOfPlayersRequired);
                var myList = responseFromDb.Items.Select(ConvertToMatchDetails).ToList();
                return new PaginatedResponse<GameDetailsDTO>
                {
                    Items = myList,
                    CurrentPage = responseFromDb.CurrentPage,
                    TotalPages = responseFromDb.TotalPages
                };
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<PaginatedResponse<GameDetailsDTO>> GetAllJoinableByStartTimePaginatorAsync(int pageNumber, int pageSize)
        {
            try
            {
                PaginatedResponse<Match> responseFromDb = await _unitOfWork.MatchRepository.GetAllJoinableByStartTimePaginatorAsync(pageNumber, pageSize);
                var myList = responseFromDb.Items.Select(ConvertToMatchDetails).ToList();
                return new PaginatedResponse<GameDetailsDTO>
                {
                    Items = myList,
                    CurrentPage = responseFromDb.CurrentPage,
                    TotalPages = responseFromDb.TotalPages
                };
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<PaginatedResponse<GameDetailsDTO>> GetAllJoinableByGameTypePaginatorAsync(int pageNumber, int pageSize, int nrOfPlayersRequired)
        {
            try
            {
                PaginatedResponse<Match> responseFromDb = await _unitOfWork.MatchRepository.GetAllJoinableByGameTypePaginatorAsync(pageNumber, pageSize, nrOfPlayersRequired);
                var myList = responseFromDb.Items.Select(ConvertToMatchDetails).ToList();
                return new PaginatedResponse<GameDetailsDTO>
                {
                    Items = myList,
                    CurrentPage = responseFromDb.CurrentPage,
                    TotalPages = responseFromDb.TotalPages
                };
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<PaginatedResponse<GameDetailsDTO>> GetAllActiveByCityPaginatedAsync(int cityId, int pageNumber, int pageSize)
        {
            try
            {
                PaginatedResponse<Match> responseFromDb = await _unitOfWork.MatchRepository.GetAllActiveByCityPaginatedAsync(pageNumber, pageSize, cityId);
                var myList = responseFromDb.Items.Select(ConvertToMatchDetails).ToList();
                return new PaginatedResponse<GameDetailsDTO>
                {
                    Items = myList,
                    CurrentPage = responseFromDb.CurrentPage,
                    TotalPages = responseFromDb.TotalPages
                };
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<PaginatedResponse<GameDetailsDTO>> GetByMatchFiltersAsync(MatchFilters filters, int pageSize, int cityId)
        {
            try
            {
                PaginatedResponse<Match> responseFromDb = await _unitOfWork.MatchRepository.GetByMatchFiltersAsync(filters, pageSize, cityId);
                var myList = responseFromDb.Items.Select(ConvertToMatchDetails).ToList();
                return new PaginatedResponse<GameDetailsDTO>
                {
                    Items = myList,
                    CurrentPage = responseFromDb.CurrentPage,
                    TotalPages = responseFromDb.TotalPages
                };
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
