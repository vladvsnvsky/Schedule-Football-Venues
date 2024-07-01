using Microsoft.EntityFrameworkCore;
using MinifootballAppApi.Data;
using MinifootballAppApi.Models;
using MinifootballAppApi.Repository.Interface;
using MinifootballAppApi.Utils;

namespace MinifootballAppApi.Repository
{
    public class UserMatchRepository : BaseRepository<UserMatch>, IUserMatchRepository
    {
        public UserMatchRepository(MinifootballDbContext context) : base(context) { }

        public async Task<ICollection<UserMatch>> GetCurrentPlayers(int matchId)
        {
            var result = await _dbSet.Where(pm => pm.MatchId == matchId).Include(pm => pm.Player)
                .ToListAsync();

            return result;
        }
        

        public async Task<bool> ExistOverlappingMatchesByPlayerIdAndTimeRangeAsync(int userId, DateTime startTime, DateTime endTime)
        {
            var userMatches = await _dbSet.Where(pm => pm.PlayerId == userId).Include(um => um.Match).ToListAsync();

            //verif daca jucatorul mai are vreun meci de jucat care da overlap la meciul curent
            //TODO: scurteaza asta
            foreach (var um in userMatches)
            {
                if (um.Match.Cancelled != true)
                {
                    if (um.Match.StartTime < endTime && um.Match.EndTime > startTime || um.Match.StartTime == startTime || um.Match.EndTime == endTime)
                        return true;
                }
            }

            return false;
        }

        //public async Task<ICollection<Match>> GetMatchesByPlayerId(int playerId)
        //{
        //    var userMatches = await _dbSet.Where(pm => pm.PlayerId == playerId)
        //        .Include(um => um.Match)
        //        .ThenInclude(um => um.Organizer)
        //        .Include(um => um.Field)
        //        .ThenInclude(um => um.Address)
        //        .ThenInclude(um => um.City)
        //        .ThenInclude(um => um.Country)
        //        .ToListAsync();
        //    ICollection<Match> matches = new List<Match>();
        //    foreach (var um in userMatches)
        //    {
        //        matches.Add(um.Match);
        //    }

        //    return matches;
        //}

        public async Task<ICollection<Match>> GetMatchesByPlayerId(int playerId)
        {
            var userMatches = await _dbSet
                .Where(um => um.PlayerId == playerId)
                .Include(um => um.Match)
                    .ThenInclude(m => m.Organizer)
                .Include(um => um.Match)
                    .ThenInclude(m => m.Field)
                        .ThenInclude(f => f.Address)
                            .ThenInclude(a => a.City)
                                .ThenInclude(c => c.Country)
                .ToListAsync();

            ICollection<Match> matches = userMatches.Select(um => um.Match).ToList();

            return matches;
        }

        public async Task<PaginatedResponse<Match>> GetMatchesByPlayerIdPaginatedAsync(int playerId, int pageNumber, int pageSize)
        {
            var userMatchesQuery = _dbSet
                .Where(um => um.PlayerId == playerId)
                .Include(um => um.Match)
                    .ThenInclude(m => m.Organizer)
                .Include(um => um.Match)
                    .ThenInclude(m => m.Field)
                        .ThenInclude(f => f.Address)
                            .ThenInclude(a => a.City)
                                .ThenInclude(c => c.Country);

            // Filter out cancelled and finished matches
            var filteredUserMatches = userMatchesQuery.Where(um => um.Match.Cancelled == false && um.Match.Finished == false);

            // Total matches count
            var totalMatchesCount = await filteredUserMatches.CountAsync();

            // Apply pagination
            var paginatedUserMatches = await filteredUserMatches
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

            ICollection<Match> matches = paginatedUserMatches.Select(um => um.Match).ToList();

            return new PaginatedResponse<Match>
            {
                Items = matches,
                TotalPages = (int)Math.Ceiling(totalMatchesCount / (double)pageSize),
                CurrentPage = pageNumber
            };
        }

    }
}
