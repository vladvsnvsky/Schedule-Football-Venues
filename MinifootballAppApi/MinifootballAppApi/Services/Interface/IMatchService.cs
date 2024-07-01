

using MinifootballAppApi.DTOs;
using MinifootballAppApi.DTOs.Create;
using MinifootballAppApi.DTOs.Filters;
using MinifootballAppApi.DTOs.Update;
using MinifootballAppApi.Utils;

namespace MinifootballAppApi.Services.Interface
{
    public interface IMatchService
    {
        Task CreateAsync(CreateMatchDTO matchDTO);
        Task<MatchDTO> GetByIdAsync(int id);
        Task<ICollection<MatchDTO>> GetAllAsync();
        Task<ICollection<MatchDTO>> GetMatchesByCity(int cityId);
        Task<ICollection<GameDetailsDTO>> GetAllActiveAsync();
        Task<MatchDTO> UpdateAsync(int id, UpdateMatchDTO dto);
        Task DeleteAsync(int id);
        public Task RefreshMatchTableState();
        Task PlayerJoinMatch(int userId, int matchId);
        Task CancelMatch(int matchId, string cancellationReason, int userId);
        Task LeaveMatch(int matchId, int playerId);
        Task<ICollection<GameDetailsDTO>> GetAllActiveByCityAsync(int cityId);
        Task<ICollection<GameDetailsDTO>> GetAllActiveByFieldAsync(int fieldId);
        Task<ICollection<GameDetailsDTO>> GetAllByPlayerAsync(int playerId);
        Task<GameDetailsDTO> GetMatchDetailsById(int id);
        public Task RefreshJob(string jobType, string startTie);
        Task DeactivateGame(int matchId);

        Task<PaginatedResponse<GameDetailsDTO>> GetAllByStartTimePaginatorAsync(int pageNumber, int pageSize);
        Task<PaginatedResponse<GameDetailsDTO>> GetAllActiveByStartTimePaginatorAsync(int pageNumber, int pageSize);
        Task<PaginatedResponse<GameDetailsDTO>> GetAllByGameTypePaginatorAsync(int pageNumber, int pageSize, int nrOfPlayersRequired);
        Task<PaginatedResponse<GameDetailsDTO>> GetAllActiveByGameTypePaginatorAsync(int pageNumber, int pageSize, int nrOfPlayersRequired);
        Task<PaginatedResponse<GameDetailsDTO>> GetAllJoinableByStartTimePaginatorAsync(int pageNumber, int pageSize);
        Task<PaginatedResponse<GameDetailsDTO>> GetAllJoinableByGameTypePaginatorAsync(int pageNumber, int pageSize, int nrOfPlayersRequired);
        Task<PaginatedResponse<GameDetailsDTO>> GetAllActiveByPlayerPaginatorAsync(int playerId, int pageNumber, int pageSize);
        Task<PaginatedResponse<GameDetailsDTO>> GetAllActiveByCityPaginatedAsync(int pageNumber, int pageSize, int cityId);
        Task<PaginatedResponse<GameDetailsDTO>> GetByMatchFiltersAsync(MatchFilters filters, int pageSize, int cityId);
    }
}
