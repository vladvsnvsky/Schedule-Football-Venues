using MinifootballAppApi.DTOs;

namespace MinifootballAppApi.Services.Interface
{
    public interface ICountryService
    {
        Task CreateAsync(CountryDTO dto);
        Task<CountryDTO> GetByIdAsync(int id);
        Task<ICollection<CountryDTO>> GetAllAsync();
        Task<CountryDTO> UpdateAsync(int id, CountryDTO dto);
        Task DeleteAsync(int id);
    }

}
