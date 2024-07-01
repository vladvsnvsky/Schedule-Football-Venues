using MinifootballAppApi.DTOs;
using MinifootballAppApi.DTOs.Create;
using MinifootballAppApi.Models;
using MinifootballAppApi.Utils;

namespace MinifootballAppApi.Services.Interface
{
    public interface IFieldService
    {
        Task CreateAsync(CreateFieldDTO dto);
        Task<FieldDTO> GetByIdAsync(int id);
        Task<VenueDetailsDTO> GetDetailsByIdAsync(int id);
        Task<ICollection<VenueDetailsDTO>> GetDetailsByCityIdAsync(int cityid);
        Task<ICollection<VenueDetailsDTO>> GetAllDetails();
        Task<FieldDTO> UpdateAsync(int id, VenueDetailsDTO dto);
        Task DeleteAsync(int id);
        Task<ICollection<TimeSpan>> GetAvailableHoursAtFieldByDay(int day, int month, int year, int fieldId);
        Task<PaginatedResponse<VenueDetailsDTO>> GetAllFieldsByCityIdPaginatedAsync(int cityId, int pageNumber, int pageSize);
        Task<ICollection<FieldDTO>> GetByCityId(int id);
        public Task<UpdateRequestResponse<FieldDTO>> SetActive(int fieldId);
        public Task<UpdateRequestResponse<FieldDTO>> SetInactive(int fieldId);
    }
}
