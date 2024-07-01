using Microsoft.EntityFrameworkCore;
using MinifootballAppApi.Data;
using MinifootballAppApi.Models;
using MinifootballAppApi.Repository.Interface;

namespace MinifootballAppApi.Repository
{
    
    public class BaseRepository<T> : IBaseRepository<T> where T : class
    {
        protected readonly MinifootballDbContext _context;
        protected readonly DbSet<T> _dbSet;

        public BaseRepository(MinifootballDbContext context)
        {
            _context = context;
            _dbSet = context.Set<T>();
        }

        
        public async Task CreateAsync(T entity)
        {

            using (var context = new MinifootballDbContext())
            {
                try
                {
                    await context.Set<T>().AddAsync(entity);
                    await context.SaveChangesAsync();
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
            }
        }

        public async Task DeleteAsync(T entity)
        {
            try
            {
                _dbSet.Remove(entity);
                await _context.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                // Log the exception or rethrow
                throw; // or log the exception
            }
        }

        public async Task<T> GetAsync(int id)
        {
            return await _dbSet.FindAsync(id);
        }

        public async Task<ICollection<T>> GetAllAsync()
        {
            return await _dbSet.ToListAsync();
        }

        public async Task UpdateAsync(T entity)
        {
            using (var context = new MinifootballDbContext())
            {
                try
                {
                    context.Set<T>().Update(entity);
                    await context.SaveChangesAsync();
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
            }
        }

        public IQueryable<T> GetQueryable()
        {
            return _context.Set<T>().AsQueryable();
        }
    }
}
