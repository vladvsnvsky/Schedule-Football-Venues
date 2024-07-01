using MinifootballAppApi.DTOs;

namespace MinifootballAppApi.Services.Interface
{
    public interface ICityService
    {
        Task CreateAsync(CityDTO dto);
        Task<CityDTO> GetByIdAsync(int id);
        Task<ICollection<CityDTO>> GetAllAsync();
        Task<CityDTO> UpdateAsync(int id, CityDTO dto);
        Task DeleteAsync(int id);
    }
}
