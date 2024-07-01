using MinifootballAppApi.Models;
using MinifootballAppApi.Utils;

namespace MinifootballAppApi.Repository.Interface
{
    public interface IUserMatchRepository: IBaseRepository<UserMatch>
    {
        Task<ICollection<UserMatch>> GetCurrentPlayers(int matchId);
        Task<bool> ExistOverlappingMatchesByPlayerIdAndTimeRangeAsync(int userId, DateTime startTime, DateTime endTime);
        Task<ICollection<Match>> GetMatchesByPlayerId(int playerId);
        Task<PaginatedResponse<Match>> GetMatchesByPlayerIdPaginatedAsync(int playerId, int pageNumber, int pageSize);
    }
}
