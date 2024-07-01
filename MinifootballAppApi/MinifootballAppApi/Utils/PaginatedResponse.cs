
namespace MinifootballAppApi.Utils
{
   public class PaginatedResponse<T> where T : class
    {
        public long CurrentPage { get; set; }
        public long TotalPages { get; set; }
        public ICollection<T> Items { get; set; } = new List<T>();

       
    }
}
