using MinifootballAppApi.DTOs;

namespace MinifootballAppApi.Services.Interface
{
    public interface IRoleService
    {
        Task CreateAsync(RoleDTO addressDTO);
        Task<RoleDTO> GetByIdAsync(int id);
        Task<ICollection<RoleDTO>> GetAllAsync();
        Task<RoleDTO> UpdateAsync(int id, RoleDTO dto);
        Task DeleteAsync(int id);
    }
}
