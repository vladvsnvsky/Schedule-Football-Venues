using Microsoft.EntityFrameworkCore;
using MinifootballAppApi.Data;
using MinifootballAppApi.Exceptions;
using MinifootballAppApi.Models;
using MinifootballAppApi.Repository.Interface;
using MinifootballAppApi.Utils;

namespace MinifootballAppApi.Repository
{
    public class FieldRepository : BaseRepository<Field>, IFieldRepository
    {
        public FieldRepository(MinifootballDbContext context) : base(context) { }

        public async Task<Field> GetById(int id)
        {
            var result = await _dbSet.Include(f => f.Address)
                .ThenInclude(f => f.City)
                .ThenInclude(f => f.Country)
                .FirstOrDefaultAsync(f => f.Id == id);
            return result;
        }

        public async Task<ICollection<Field>> GetAllFieldsByCityId(int cityId)
        {
            var result = await _dbSet
                .Include(f => f.Address)
                .ThenInclude(a => a.City)
                .Where(f => f.Address.CityId == cityId)
                .ToListAsync();

            return result;
        }
        public async Task<ICollection<Field>> GetAllFieldsAsync()
        {
            return await _dbSet.Include(f => f.Address)
                .ThenInclude(f => f.City)
                .ThenInclude(f => f.Country)
                .Include(f=>f.Matches)
                .ToListAsync();
        }

        public async Task<PaginatedResponse<Field>> GetAllFieldsByCityIdPaginatedAsync(int cityId, int pageNumber, int pageSize)
        {
            // Get the queryable for fields filtered by cityId
            var query = _dbSet.Include(f => f.Address)
                .ThenInclude(a => a.City)
                .ThenInclude(c => c.Country)
                .Include(f => f.Matches)
                .Where(f => f.Address.CityId == cityId);

            // Get the total count of items for pagination
            var totalItems = await query.CountAsync();

            // Get the paginated list of fields
            var fields = await query
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

            // Create the paginated response
            var response = new PaginatedResponse<Field>
            {
                Items = fields,
                CurrentPage = pageNumber,
                TotalPages = (int)Math.Ceiling(totalItems / (double)pageSize),
            };

            return response;
        }

    }
}
