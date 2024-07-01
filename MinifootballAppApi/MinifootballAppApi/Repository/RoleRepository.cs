using MinifootballAppApi.Data;
using MinifootballAppApi.Models;
using MinifootballAppApi.Repository.Interface;

namespace MinifootballAppApi.Repository
{
    public class RoleRepository : BaseRepository<Role>, IRoleRepository
    {
        public RoleRepository(MinifootballDbContext context) : base(context)
        {
        }
    }
}
