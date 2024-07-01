using MinifootballAppApi.Models;

namespace MinifootballAppApi.Repository.Interface
{
    public interface ICountryRepository : IBaseRepository<Country>
    {
        Task<Country> GetById(int param);
        Task<Country> GetByName(string param);
    }
}
