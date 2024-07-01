using MinifootballAppApi.Models;

namespace MinifootballAppApi.Repository.Interface
{
    public interface ICityRepository : IBaseRepository<City>
    {
        Task<City> GetByNameAndCountryId(string cityName, int countryId);
    }
}
