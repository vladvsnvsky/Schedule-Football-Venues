using MinifootballAppApi.Models;
using MinifootballAppApi.Utils;

namespace MinifootballAppApi.Repository.Interface
{
    public interface IFieldRepository : IBaseRepository<Field>
    {
        Task<ICollection<Field>> GetAllFieldsAsync();
        Task<Field> GetById(int id);
        Task<PaginatedResponse<Field>> GetAllFieldsByCityIdPaginatedAsync(int cityId, int pageSize, int pageNumber);
        Task<ICollection<Field>> GetAllFieldsByCityId(int cityId);
    }
}
