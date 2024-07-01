using AutoMapper;
using MinifootballAppApi.DTOs;
using MinifootballAppApi.Repository.Interface;
using MinifootballAppApi.Services.Interface;

namespace MinifootballAppApi.Services
{
    public class RoleService : IRoleService
    {
        private readonly IMapper _mapper;
        private readonly IUnitOfWork _unitOfWork;

        public Task CreateAsync(RoleDTO dto)
        {
            throw new NotImplementedException();
        }

        public Task DeleteAsync(int id)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<RoleDTO>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public Task<RoleDTO> GetByIdAsync(int id)
        {
            throw new NotImplementedException();
        }

        public Task<RoleDTO> UpdateAsync(int id, RoleDTO dto)
        {
            throw new NotImplementedException();
        }
    }
}
