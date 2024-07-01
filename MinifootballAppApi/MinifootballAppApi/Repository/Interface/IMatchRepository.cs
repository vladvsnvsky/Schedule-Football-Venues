using MinifootballAppApi.DTOs.Filters;
using MinifootballAppApi.Models;
using MinifootballAppApi.Utils;

namespace MinifootballAppApi.Repository.Interface
{
    public interface IMatchRepository : IBaseRepository<Match>
    {
        Task<ICollection<Match>> GetAllMatches();
        Task<ICollection<Match>> GetAllActiveMatches();
        Task<Match> GetMatchById(int id);
        Task<ICollection<Match>> GetMatchesByCity(int cityId);
        Task<ICollection<Match>> GetMatchesByCountry(int countryId);
        Task<ICollection<Match>> GetMatchesByField(int fieldId);
        
        Task<ICollection<Match>> GetMatchesByOrganizerId(int organizerId);
        Task<ICollection<Match>> GetByFieldIdAndTimeRangeAsync(int fieldId, DateTime startTime, DateTime endTime);
        Task<ICollection<Match>> GetMatchesAtFieldByDay(int day, int month, int year, int fieldId);
        Task<PaginatedResponse<Match>> GetAllByStartTimePaginatorAsync(int pageNumber, int pageSize);
        Task<PaginatedResponse<Match>> GetAllActiveByStartTimePaginatorAsync(int pageNumber, int pageSize);
        Task<PaginatedResponse<Match>> GetAllByGameTypePaginatorAsync(int pageNumber, int pageSize, int nrOfPlayersRequired);
        Task<PaginatedResponse<Match>> GetAllActiveByGameTypePaginatorAsync(int pageNumber, int pageSize, int nrOfPlayersRequired);
        Task<PaginatedResponse<Match>> GetAllJoinableByStartTimePaginatorAsync(int pageNumber, int pageSize);
        Task<PaginatedResponse<Match>> GetAllJoinableByGameTypePaginatorAsync(int pageNumber, int pageSize, int nrOfPlayersRequired);
        Task<PaginatedResponse<Match>> GetAllActiveByCityPaginatedAsync(int pageNumber, int pageSize, int cityId);
        Task<PaginatedResponse<Match>> GetByMatchFiltersAsync(MatchFilters filters, int pageNumber, int pageSize);
    }
}
