using Microsoft.EntityFrameworkCore;
using MinifootballAppApi.Data;
using MinifootballAppApi.Exceptions;
using MinifootballAppApi.Models;
using MinifootballAppApi.Repository.Interface;

namespace MinifootballAppApi.Repository
{
    public class CityRepository : BaseRepository<City>, ICityRepository
    {
        public CityRepository(MinifootballDbContext context) : base(context)
        {
        }


        public async Task<City> GetByNameAndCountryId(string cityName, int countryId)
        {
            return await _dbSet
                    .Where(c => c.Name.Equals(cityName, StringComparison.OrdinalIgnoreCase) && c.CountryId == countryId)
                    .FirstOrDefaultAsync();
        }



    }
}
