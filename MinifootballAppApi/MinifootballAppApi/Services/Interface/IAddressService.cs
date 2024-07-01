using MinifootballAppApi.DTOs;
using MinifootballAppApi.Models;

namespace MinifootballAppApi.Services.Interface
{
    public interface IAddressService
    {
        Task CreateAsync(AddressDTO addressDTO);
        Task<AddressDTO> GetByUserIdAsync(int id);
        Task<AddressDTO> GetById(int id);
        Task<ICollection<AddressDTO>> GetAllAsync();
        Task<AddressDTO> UpdateAsync(int id, AddressDTO dto);
        Task DeleteAsync(int id);
        Task<AddressDTO> GetByFieldIdAsync(int id);
    }
}
