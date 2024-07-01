using MinifootballAppApi.Models;

namespace MinifootballAppApi.Repository.Interface
{
    public interface IAddressRepository : IBaseRepository<Address>
    {
        Task<Address> GetByIdAsync(int id);
    }
}
