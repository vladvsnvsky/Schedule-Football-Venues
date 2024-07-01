using Microsoft.EntityFrameworkCore;
using MinifootballAppApi.Data;
using MinifootballAppApi.Models;
using MinifootballAppApi.Repository.Interface;

namespace MinifootballAppApi.Repository
{
    public class AddressRepository : BaseRepository<Address>, IAddressRepository
    {
        public AddressRepository(MinifootballDbContext context) : base(context)
        {
        }

        public async Task<Address> GetByIdAsync(int id)
        {
            var result = await _dbSet.Include(a => a.City)
                .ThenInclude(f => f.Country)
                .FirstOrDefaultAsync(f => f.Id == id);
            return result;
        }

    }
}
