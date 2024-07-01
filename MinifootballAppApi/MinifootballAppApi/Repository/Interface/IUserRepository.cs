using MinifootballAppApi.DTOs.Filters;
using MinifootballAppApi.Models;
using MinifootballAppApi.Utils;

namespace MinifootballAppApi.Repository.Interface
{
    public interface IUserRepository : IBaseRepository<UserEntity>
    {
        Task<UserEntity> GetById(int id);
        Task<UserEntity> GetByUsername(string username);
        Task<UserEntity> GetByEmail(string email);
        Task<UserEntity> GetByJWT(string param);
        Task<ICollection<UserEntity>> GetAdmins();
        Task <ICollection<UserEntity>> GetByCityId(int cityId);
        Task<ICollection<UserEntity>> GetBannedUsers();
        Task<PaginatedResponse<UserEntity>> GetUsersPaginatedAsync(int currentPage, int pageSize, UserFilter usersFilter);
        Task<PaginatedResponse<UserEntity>> GetUsersBySubstringPaginated(int currentPage, int pageSize, string str);
    }
}
