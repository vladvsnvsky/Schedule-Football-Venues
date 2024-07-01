namespace MinifootballAppApi.Repository.Interface
{
    public interface IBaseRepository<T> where T : class
    {
        Task<T> GetAsync(int id);
        Task CreateAsync(T entity);
        Task UpdateAsync(T entity);
        Task DeleteAsync(T entity);
        Task<ICollection<T>> GetAllAsync();
        IQueryable<T> GetQueryable();
    }
}
