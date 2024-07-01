using AutoMapper;
using Microsoft.AspNetCore.SignalR;
using MinifootballAppApi.Controllers;
using MinifootballAppApi.DTOs;
using MinifootballAppApi.DTOs.Create;
using MinifootballAppApi.Exceptions;
using MinifootballAppApi.Hubs;
using MinifootballAppApi.Models;
using MinifootballAppApi.Repository.Interface;
using MinifootballAppApi.Services;
using Moq;
using System;
using Match = MinifootballAppApi.Models.Match;

namespace TestProjectMinifootballAppApi
{
    public class MatchServiceTest
    {
        private readonly Mock<IUnitOfWork> _unitOfWorkMock;
        private readonly Mock<IMapper> _mapperMock;
        private readonly Mock<IHubContext<GameHub>> _hubContextMock;
        private readonly MatchService _matchService;

        public MatchServiceTest()
        {
            _unitOfWorkMock = new Mock<IUnitOfWork>();
            _mapperMock = new Mock<IMapper>();
            _hubContextMock = new Mock<IHubContext<GameHub>>();
            _matchService = new MatchService(_hubContextMock.Object, _unitOfWorkMock.Object, _mapperMock.Object);
        }

        [Fact]
        public async Task CreateAsync_ShouldThrowException_WhenOrganizerIsBanned()
        {
            // Arrange
            var matchDTO = new CreateMatchDTO { OrganizerId = 1 };
            var user = new UserEntity { IsBanned = true };

            _unitOfWorkMock.Setup(u => u.UserRepository.GetById(It.IsAny<int>())).ReturnsAsync(user);

            // Act & Assert
            var exception = await Assert.ThrowsAsync<Exception>(() => _matchService.CreateAsync(matchDTO));
            Assert.Equal("You've been temporarly banned. You cannot create or join a game right now!", exception.Message);
        }

        [Fact]
        public async Task CreateAsync_ShouldThrowException_WhenOrganizerStartTimeIslEssThan24Hours()
        {
            // Arrange
            var matchDTO = new CreateMatchDTO { OrganizerId = 1, StartDay = DateTime.Now.Day, StartMonth = DateTime.Now.Month, StartYear = DateTime.Now.Year };
            var user = new UserEntity { IsBanned = true };

            _unitOfWorkMock.Setup(u => u.UserRepository.GetById(It.IsAny<int>())).ReturnsAsync(user);

            // Act & Assert
            var exception = await Assert.ThrowsAsync<Exception>(() => _matchService.CreateAsync(matchDTO));
            Assert.Equal("You've been temporarly banned. You cannot create or join a game right now!", exception.Message);
        }

        [Fact]
        public async Task CreateAsync_ShouldCallCompleteAsync_WhenMatchIsValid()
        {
            // Arrange
            var matchDTO = new CreateMatchDTO
            {
                OrganizerId = 1,
                FieldId = 1,
                StartYear = DateTime.Now.Year,
                StartMonth = DateTime.Now.Month,
                StartDay = DateTime.Now.AddDays(2).Day,
                StartHour = DateTime.Now.Hour,
                EndYear = DateTime.Now.Year,
                EndMonth = DateTime.Now.Month,
                EndDay = DateTime.Now.AddDays(2).Day,
                EndHour = DateTime.Now.AddHours(1).Hour,
                NrOfPlayersRequired = 10,
                PricePerPlayerUnits = 100 // Example value
            };
            var user = new UserEntity { Id = 1, IsBanned = false };
            var match = new Match
            {
                FieldId = 1,
                StartTime = new DateTime(matchDTO.StartYear, matchDTO.StartMonth, matchDTO.StartDay, matchDTO.StartHour, 0, 0),
                EndTime = new DateTime(matchDTO.EndYear, matchDTO.EndMonth, matchDTO.EndDay, matchDTO.EndHour, 0, 0),
                NrOfPlayersRequired = 10,
                Players = new List<UserMatch>()
            };

            _unitOfWorkMock.Setup(u => u.UserRepository.GetById(It.IsAny<int>())).ReturnsAsync(user);
            _mapperMock.Setup(m => m.Map<Match>(It.IsAny<CreateMatchDTO>())).Returns(match);
            _unitOfWorkMock.Setup(u => u.MatchRepository.GetByFieldIdAndTimeRangeAsync(It.IsAny<int>(), It.IsAny<DateTime>(), It.IsAny<DateTime>())).ReturnsAsync(new List<Match>());
            _unitOfWorkMock.Setup(u => u.MatchRepository.CreateAsync(It.IsAny<Match>())).Returns(Task.CompletedTask);
            _unitOfWorkMock.Setup(u => u.CompleteAsync()).Returns(Task.CompletedTask);

            // Act
            await _matchService.CreateAsync(matchDTO);

            // Assert
            _unitOfWorkMock.Verify(u => u.CompleteAsync(), Times.Once);
        }

        [Fact]
        public async Task GetAllAsync_ShouldReturnAllMatches()
        {
            // Arrange
            var matches = new List<Match>
                {
                    new Match { Id = 1, FieldId = 1, StartTime = DateTime.Now, EndTime = DateTime.Now.AddHours(1), NrOfPlayersRequired = 10 },
                    new Match { Id = 2, FieldId = 2, StartTime = DateTime.Now, EndTime = DateTime.Now.AddHours(1), NrOfPlayersRequired = 8 }
                };

            var matchesDTO = new List<MatchDTO>
                {
                    new MatchDTO { Id = 1, FieldId = 1, StartTime = DateTime.Now, EndTime = DateTime.Now.AddHours(1), NrOfPlayersRequired = 10 },
                    new MatchDTO { Id = 2, FieldId = 2, StartTime = DateTime.Now, EndTime = DateTime.Now.AddHours(1), NrOfPlayersRequired = 8 }
                };

            _unitOfWorkMock.Setup(u => u.MatchRepository.GetAllMatches()).ReturnsAsync(matches);
            _mapperMock.Setup(m => m.Map<MatchDTO>(matches[0])).Returns(matchesDTO[0]);
            _mapperMock.Setup(m => m.Map<MatchDTO>(matches[1])).Returns(matchesDTO[1]);

            // Act
            var result = await _matchService.GetAllAsync();

            // Assert
            Assert.NotNull(result);
            Assert.Equal(matchesDTO.Count, result.Count);
            Assert.Equal(matchesDTO[0].Id, result.First().Id);
            Assert.Equal(matchesDTO[1].Id, result.Last().Id);
        }

        [Fact]
        public async Task DeleteAsync_ShouldCallDeleteAsync_WhenMatchExists()
        {
            // Arrange
            var matchId = 1;
            var match = new Match { Id = matchId };

            _unitOfWorkMock.Setup(u => u.MatchRepository.GetAsync(matchId)).ReturnsAsync(match);
            _unitOfWorkMock.Setup(u => u.MatchRepository.DeleteAsync(match)).Returns(Task.CompletedTask);
            _unitOfWorkMock.Setup(u => u.CompleteAsync()).Returns(Task.CompletedTask);

            // Act
            await _matchService.DeleteAsync(matchId);

            // Assert
            _unitOfWorkMock.Verify(u => u.MatchRepository.GetAsync(matchId), Times.Once);
            _unitOfWorkMock.Verify(u => u.MatchRepository.DeleteAsync(match), Times.Once);

        }
        [Fact]
        public async Task DeleteAsync_ShouldThrowEntityNotFoundException_WhenMatchDoesNotExist()
        {
            // Arrange
            var matchId = 1;

            _unitOfWorkMock.Setup(u => u.MatchRepository.GetAsync(matchId)).ReturnsAsync((Match)null);

            // Act & Assert
            var exception = await Assert.ThrowsAsync<EntityNotFoundException>(() => _matchService.DeleteAsync(matchId));
            Assert.Equal($"Match with id {matchId} not found.", exception.Message);

            _unitOfWorkMock.Verify(u => u.MatchRepository.GetAsync(matchId), Times.Once);
            _unitOfWorkMock.Verify(u => u.MatchRepository.DeleteAsync(It.IsAny<Match>()), Times.Never);

        }

        [Fact]
        public async Task CancelMatch_ShouldCancelMatch_WhenCalledByOrganizer()
        {
            // Arrange
            var matchId = 1;
            var userId = 1;
            var cancellationReason = "Test reason";
            var match = new Match
            {
                Id = matchId,
                OrganizerId = userId,
                StartTime = DateTime.Now.AddHours(25),
                Cancelled = false
            };
            var admins = new List<UserEntity>();

            _unitOfWorkMock.Setup(u => u.MatchRepository.GetMatchById(matchId)).ReturnsAsync(match);
            _unitOfWorkMock.Setup(u => u.UserRepository.GetAdmins()).ReturnsAsync(admins);
            _unitOfWorkMock.Setup(u => u.MatchRepository.UpdateAsync(match)).Returns(Task.CompletedTask);
            _unitOfWorkMock.Setup(u => u.CompleteAsync()).Returns(Task.CompletedTask);

            // Act
            await _matchService.CancelMatch(matchId, cancellationReason, userId);

            // Assert
            _unitOfWorkMock.Verify(u => u.MatchRepository.GetMatchById(matchId), Times.Once);
            _unitOfWorkMock.Verify(u => u.UserRepository.GetAdmins(), Times.Once);
            _unitOfWorkMock.Verify(u => u.MatchRepository.UpdateAsync(match), Times.Once);
            _unitOfWorkMock.Verify(u => u.CompleteAsync(), Times.Once);
            Assert.True(match.Cancelled);
            Assert.Equal(cancellationReason, match.CancelledReason);
            Assert.False(match.PlayerCanJoin);
        }

        [Fact]
        public async Task CancelMatch_ShouldCancelMatch_WhenCalledByAdmin()
        {
            // Arrange
            var matchId = 1;
            var userId = 2;
            var cancellationReason = "Test reason";
            var match = new Match
            {
                Id = matchId,
                OrganizerId = 1,
                StartTime = DateTime.Now.AddHours(25),
                Cancelled = false
            };
            var admins = new List<UserEntity> { new UserEntity { Id = userId } };

            _unitOfWorkMock.Setup(u => u.MatchRepository.GetMatchById(matchId)).ReturnsAsync(match);
            _unitOfWorkMock.Setup(u => u.UserRepository.GetAdmins()).ReturnsAsync(admins);
            _unitOfWorkMock.Setup(u => u.MatchRepository.UpdateAsync(match)).Returns(Task.CompletedTask);
            _unitOfWorkMock.Setup(u => u.CompleteAsync()).Returns(Task.CompletedTask);

            // Act
            await _matchService.CancelMatch(matchId, cancellationReason, userId);

            // Assert
            _unitOfWorkMock.Verify(u => u.MatchRepository.GetMatchById(matchId), Times.Once);
            _unitOfWorkMock.Verify(u => u.UserRepository.GetAdmins(), Times.Once);
            _unitOfWorkMock.Verify(u => u.MatchRepository.UpdateAsync(match), Times.Once);
            _unitOfWorkMock.Verify(u => u.CompleteAsync(), Times.Once);
            Assert.True(match.Cancelled);
            Assert.Equal(cancellationReason, match.CancelledReason);
            Assert.False(match.PlayerCanJoin);
        }

        [Fact]
        public async Task CancelMatch_ShouldThrowException_WhenMatchNotFound()
        {
            // Arrange
            var matchId = 1;
            var userId = 1;
            var cancellationReason = "Test reason";

            _unitOfWorkMock.Setup(u => u.MatchRepository.GetMatchById(matchId)).ReturnsAsync((Match)null);

            // Act & Assert
            var exception = await Assert.ThrowsAsync<Exception>(() => _matchService.CancelMatch(matchId, cancellationReason, userId));
            Assert.Equal("Match not found!", exception.Message);

        }

        [Fact]
        public async Task CancelMatch_ShouldThrowException_WhenUserIsNotOrganizerOrAdmin()
        {
            // Arrange
            var matchId = 1;
            var userId = 2;
            var cancellationReason = "Test reason";
            var match = new Match
            {
                Id = matchId,
                OrganizerId = 1,
                StartTime = DateTime.Now.AddHours(25),
                Cancelled = false
            };
            var admins = new List<UserEntity>();

            _unitOfWorkMock.Setup(u => u.MatchRepository.GetMatchById(matchId)).ReturnsAsync(match);
            _unitOfWorkMock.Setup(u => u.UserRepository.GetAdmins()).ReturnsAsync(admins);

            // Act & Assert
            var exception = await Assert.ThrowsAsync<Exception>(() => _matchService.CancelMatch(matchId, cancellationReason, userId));
            Assert.Equal("You are not allowed to cancel this game because you are not the organizer!", exception.Message);

            _unitOfWorkMock.Verify(u => u.MatchRepository.GetMatchById(matchId), Times.Once);
            _unitOfWorkMock.Verify(u => u.UserRepository.GetAdmins(), Times.Once);
            _unitOfWorkMock.Verify(u => u.MatchRepository.UpdateAsync(It.IsAny<Match>()), Times.Never);
            _unitOfWorkMock.Verify(u => u.CompleteAsync(), Times.Never);
        }

        [Fact]
        public async Task CancelMatch_ShouldThrowException_WhenLessThan24HoursAndNotAdmin()
        {
            // Arrange
            var matchId = 1;
            var userId = 1;
            var cancellationReason = "Test reason";
            var match = new Match
            {
                Id = matchId,
                OrganizerId = userId,
                StartTime = DateTime.Now.AddHours(10),
                Cancelled = false
            };
            var admins = new List<UserEntity>();

            _unitOfWorkMock.Setup(u => u.MatchRepository.GetMatchById(matchId)).ReturnsAsync(match);
            _unitOfWorkMock.Setup(u => u.UserRepository.GetAdmins()).ReturnsAsync(admins);

            // Act & Assert
            var exception = await Assert.ThrowsAsync<Exception>(() => _matchService.CancelMatch(matchId, cancellationReason, userId));
            Assert.Equal("You cannot cancel a game with less than 24 hours before the game starts.", exception.Message);

            _unitOfWorkMock.Verify(u => u.MatchRepository.GetMatchById(matchId), Times.Once);
            _unitOfWorkMock.Verify(u => u.UserRepository.GetAdmins(), Times.Once);
            _unitOfWorkMock.Verify(u => u.MatchRepository.UpdateAsync(It.IsAny<Match>()), Times.Never);
            _unitOfWorkMock.Verify(u => u.CompleteAsync(), Times.Never);
        }

        [Fact]
        public async Task PlayerJoinMatch_ShouldThrowException_WhenUserIsBanned()
        {
            // Arrange
            var userId = 1;
            var matchId = 1;
            var match = new Match
            {
                Id = matchId,
                OrganizerId = 2,
                StartTime = DateTime.Now.AddHours(25),
                PlayerCanJoin = true
            };
            var user = new UserEntity { Id = userId, IsBanned = true };

            _unitOfWorkMock.Setup(u => u.MatchRepository.GetMatchById(matchId)).ReturnsAsync(match);
            _unitOfWorkMock.Setup(u => u.UserRepository.GetAsync(userId)).ReturnsAsync(user);

            // Act & Assert
            var exception = await Assert.ThrowsAsync<Exception>(() => _matchService.PlayerJoinMatch(userId, matchId));
            Assert.Equal("You've been temporarly banned! You cannot join or create a game right now!", exception.Message);
        }

        [Fact]
        public async Task PlayerJoinMatch_ShouldThrowException_WhenMatchNotFound()
        {
            var userId = 1;
            var matchId = 23;
            var match = new Match
            {
                Id = matchId,
                OrganizerId = 2,
                StartTime = DateTime.Now.AddHours(25),
                PlayerCanJoin = false
            };

            var user = new UserEntity { Id = userId, IsBanned = false };
            _unitOfWorkMock.Setup(u => u.MatchRepository.GetMatchById(matchId)).ReturnsAsync((Match)null);

            var exception = await Assert.ThrowsAsync<Exception>(() => _matchService.PlayerJoinMatch(userId, matchId));
            Assert.Equal($"Match with id {matchId} not found!", exception.Message);

        }
        [Fact]
        public async Task PlayerJoinMatch_ShouldThrowException_WhenPlayerCannotJoin()
        {
            // Arrange
            var userId = 1;
            var matchId = 1;
            var match = new Match
            {
                Id = matchId,
                OrganizerId = 2,
                StartTime = DateTime.Now.AddHours(25),
                PlayerCanJoin = false
            };
            var user = new UserEntity { Id = userId, IsBanned = false };

            _unitOfWorkMock.Setup(u => u.MatchRepository.GetMatchById(matchId)).ReturnsAsync(match);
            _unitOfWorkMock.Setup(u => u.UserRepository.GetAsync(userId)).ReturnsAsync(user);

            // Act & Assert
            var exception = await Assert.ThrowsAsync<Exception>(() => _matchService.PlayerJoinMatch(userId, matchId));
            Assert.Equal("Players can NOT join this game anymore!", exception.Message);
        }

        [Fact]
        public async Task PlayerJoinMatch_ShouldThrowException_WhenLessThan24Hours()
        {
            // Arrange
            var userId = 1;
            var matchId = 1;
            var match = new Match
            {
                Id = matchId,
                OrganizerId = 2,
                StartTime = DateTime.Now.AddHours(10),
                PlayerCanJoin = true
            };
            var user = new UserEntity { Id = userId, IsBanned = false };

            _unitOfWorkMock.Setup(u => u.MatchRepository.GetMatchById(matchId)).ReturnsAsync(match);
            _unitOfWorkMock.Setup(u => u.UserRepository.GetAsync(userId)).ReturnsAsync(user);

            // Act & Assert
            var exception = await Assert.ThrowsAsync<Exception>(() => _matchService.PlayerJoinMatch(userId, matchId));
            Assert.Equal("You are not allowed to join a game less than 24 hours before the game starts.", exception.Message);
        }

        [Fact]
        public async Task PlayerJoinMatch_ShouldThrowException_WhenOverlappingGamesExist()
        {
            // Arrange
            var userId = 1;
            var matchId = 1;
            var match = new Match
            {
                Id = matchId,
                OrganizerId = 2,
                StartTime = DateTime.Now.AddHours(25),
                EndTime = DateTime.Now.AddHours(27),
                PlayerCanJoin = true
            };
            var user = new UserEntity { Id = userId, IsBanned = false };

            _unitOfWorkMock.Setup(u => u.MatchRepository.GetMatchById(matchId)).ReturnsAsync(match);
            _unitOfWorkMock.Setup(u => u.UserRepository.GetAsync(userId)).ReturnsAsync(user);
            _unitOfWorkMock.Setup(u => u.UserMatchRepository.ExistOverlappingMatchesByPlayerIdAndTimeRangeAsync(userId, match.StartTime, match.EndTime)).ReturnsAsync(true);

            // Act & Assert
            var exception = await Assert.ThrowsAsync<Exception>(() => _matchService.PlayerJoinMatch(userId, matchId));
            Assert.Equal("You already have a game scheduled at that time!", exception.Message);
        }

        [Fact]
        public async Task RefreshMatchTableState_ShouldCancelMatchesWithInsufficientPlayers()
        {
            // Arrange
            var matches = new List<Match>
            {
                new Match
                {
                     Id = 1,
                     StartTime = DateTime.Now.AddHours(23),
                     NrOfPlayersRequired = 10,
                     CurrentNumberOfPlayers = 5,
                     Cancelled = false,
                     Finished = false,
                     PlayerCanJoin = true
                },
                new Match
                {
                     Id = 2,
                     StartTime = DateTime.Now.AddHours(25),
                     NrOfPlayersRequired = 10,
                     CurrentNumberOfPlayers = 10,
                     Cancelled = false,
                     Finished = false,
                     PlayerCanJoin = true
                }
            };

            _unitOfWorkMock.Setup(u => u.MatchRepository.GetAllActiveMatches()).ReturnsAsync(matches);
            _unitOfWorkMock.Setup(u => u.MatchRepository.UpdateAsync(It.IsAny<Match>())).Returns(Task.CompletedTask);
            _unitOfWorkMock.Setup(u => u.CompleteAsync()).Returns(Task.CompletedTask);

            // Act
            await _matchService.RefreshMatchTableState();

            // Assert
            _unitOfWorkMock.Verify(u => u.MatchRepository.UpdateAsync(It.Is<Match>(m => m.Id == 1 && m.Cancelled)), Times.Once);
            _unitOfWorkMock.Verify(u => u.CompleteAsync(), Times.Once);
        }

        [Fact]
        public async Task LeaveMatch_ShouldThrowException_WhenMatchNotFound()
        {
            // Arrange
            var matchId = 1;
            var playerId = 1;
            var unitOfWorkMock = new Mock<IUnitOfWork>();
            var hubContextMock = new Mock<IHubContext<GameHub>>();
            unitOfWorkMock.Setup(u => u.MatchRepository.GetMatchById(matchId)).ReturnsAsync((Match)null);
            var matchService = new MatchService(hubContextMock.Object, unitOfWorkMock.Object, null);

            // Act & Assert
            var exception = await Assert.ThrowsAsync<Exception>(() => matchService.LeaveMatch(matchId, playerId));
            Assert.Equal("Match not found!", exception.Message);
        }

        [Fact]
        public async Task LeaveMatch_ShouldThrowException_WhenLessThan24HoursBeforeMatch()
        {
            // Arrange
            var matchId = 1;
            var playerId = 1;
            var match = new Match
            {
                StartTime = DateTime.Now.AddHours(23)
            };
            var unitOfWorkMock = new Mock<IUnitOfWork>();
            var hubContextMock = new Mock<IHubContext<GameHub>>();
            unitOfWorkMock.Setup(u => u.MatchRepository.GetMatchById(matchId)).ReturnsAsync(match);
            var matchService = new MatchService(hubContextMock.Object, unitOfWorkMock.Object, null);

            // Act & Assert
            var exception = await Assert.ThrowsAsync<Exception>(() => matchService.LeaveMatch(matchId, playerId));
            Assert.Equal("You are not allowed to leave a game less than 24 hours before the game starts.", exception.Message);
        }

        [Fact]
        public async Task LeaveMatch_ShouldThrowException_WhenPlayerNotInMatch()
        {
            // Arrange
            var matchId = 1;
            var playerId = 1;
            var match = new Match
            {
                StartTime = DateTime.Now.AddHours(25)
            };
            var userMatches = new List<UserMatch>();
            var unitOfWorkMock = new Mock<IUnitOfWork>();
            var hubContextMock = new Mock<IHubContext<GameHub>>();
            unitOfWorkMock.Setup(u => u.MatchRepository.GetMatchById(matchId)).ReturnsAsync(match);
            unitOfWorkMock.Setup(u => u.UserMatchRepository.GetCurrentPlayers(matchId)).ReturnsAsync(userMatches);
            var matchService = new MatchService(hubContextMock.Object, unitOfWorkMock.Object, null);

            // Act & Assert
            var exception = await Assert.ThrowsAsync<Exception>(() => matchService.LeaveMatch(matchId, playerId));
            Assert.Equal("You cannot leave a game you're not part of!", exception.Message);
        }

    }
}