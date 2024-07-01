using Microsoft.EntityFrameworkCore;
using MinifootballAppApi.Data;
using MinifootballAppApi.Models;
using MinifootballAppApi.Repository.Interface;

namespace MinifootballAppApi.Repository
{
    public class CountryRepository : BaseRepository<Country>, ICountryRepository
    {
        public CountryRepository(MinifootballDbContext context) : base(context)
        {
        }

        #region READ
        public async Task<Country> GetById(int param)
        {
            var result = await _dbSet.FirstOrDefaultAsync(u => u.Id == param);
            return result;
        }

        public async Task<Country> GetByName(string param)
        {
            var result = await _dbSet.FirstOrDefaultAsync(u => u.Name == param);
            return result;
        }

        #endregion
    }
}
