using Microsoft.EntityFrameworkCore;
using MinifootballAppApi.Data;
using MinifootballAppApi.DTOs.Filters;
using MinifootballAppApi.Models;
using MinifootballAppApi.Repository.Interface;
using MinifootballAppApi.Utils;
using NuGet.Common;

namespace MinifootballAppApi.Repository
{
    public class UserRepository : BaseRepository<UserEntity>, IUserRepository
    {
        public UserRepository(MinifootballDbContext context) : base(context) { }

        #region READ
        public async Task<UserEntity> GetById(int param)
        {
            var result = await _dbSet.Include(u => u.UserDetails)
                .Include(u => u.Address).ThenInclude(a=> a.City).ThenInclude(a=>a.Country)
                .Include(u => u.UserRoles)
                .Include(u => u.UserDetails)
                .FirstOrDefaultAsync(u => u.Id == param);
            return result;
        }
      

        public async Task<UserEntity> GetByUsername(string param)
        {
            var result = await _dbSet.Include(u => u.UserDetails)
                .Include(u => u.Address)
                .Include(u => u.UserRoles).FirstOrDefaultAsync(x => x.Username == param);
            return result;
        }
        public async Task<UserEntity> GetByEmail(string param)
        {
            var result = await _dbSet.Include(u => u.UserDetails)
                .Include(u => u.Address)
                .Include(u => u.UserRoles).FirstOrDefaultAsync(x => x.Email == param);
            return result;
        }

        public async Task<UserEntity> GetByJWT(string param)
        {
            var result = await _dbSet.Include(u => u.UserDetails).Include(u => u.Address).FirstOrDefaultAsync(x => x.Token == param);
            return result;
        }

        public async Task<ICollection<UserEntity>> GetByCityId(int cityId)
        {
            var result = await _dbSet.Include(u => u.Address)
                .Include(u => u.UserRoles)
                .Include(u => u.UserDetails)
                             .Where(u => u.Address.CityId == cityId)
                             .ToListAsync();
            return result;
        }

        public async Task<ICollection<UserEntity>> GetAdmins()
        {
            var result = await _dbSet
                .Include(u => u.Address)
                .Include(u => u.UserRoles)
                .Include(u => u.UserDetails)
                .Where(u => u.UserRoles.Any(ur => ur.RoleId == 1))
                .ToListAsync();
            return result;
        }

        public async Task<ICollection<UserEntity>> GetBannedUsers()
        {
            var result = await _dbSet
                .Include(u => u.Address)
                .Include(u => u.UserRoles)
                .Include(u => u.UserDetails)
                .Where(u => u.IsBanned == true)
                .ToListAsync();
            return result;
        }

        public async Task<PaginatedResponse<UserEntity>> GetUsersPaginatedAsync(int currentPage, int pageSize, UserFilter usersFilter)
        {
            var query = _dbSet
                .Include(u => u.Address).ThenInclude(a => a.City).ThenInclude(c => c.Country)
                .Include(u => u.UserRoles)
                .Include(u => u.UserDetails)
                .AsQueryable();

            // Apply filters
            if (usersFilter.Id.HasValue)
                query = query.Where(u => u.Id == usersFilter.Id.Value);
            if (usersFilter.CountryId.HasValue)
                query = query.Where(u => u.Address.City.CountryId == usersFilter.CountryId.Value); // Assuming Address has CountryId
            if (usersFilter.CityId.HasValue)
                query = query.Where(u => u.Address.CityId == usersFilter.CityId.Value); // Assuming Address has CityId
            if (usersFilter.IsBanned.HasValue)
                query = query.Where(u => u.IsBanned == usersFilter.IsBanned);
            if (!string.IsNullOrEmpty(usersFilter.Name))
                query = query.Where(u => u.Username.Contains(usersFilter.Name));
            if (!string.IsNullOrEmpty(usersFilter.Email))
                query = query.Where(u => u.Email.Contains(usersFilter.Email));
            if (usersFilter.DayOfBirth.HasValue)
                query = query.Where(u => u.UserDetails.Birthdate.Day == usersFilter.DayOfBirth.Value); // Assuming UserDetails has DayOfBirth
            if (usersFilter.MonthOfBirth.HasValue)
                query = query.Where(u => u.UserDetails.Birthdate.Month == usersFilter.MonthOfBirth.Value); // Assuming UserDetails has MonthOfBirth
            if (usersFilter.YearOfBirth.HasValue)
                query = query.Where(u => u.UserDetails.Birthdate.Year == usersFilter.YearOfBirth.Value); // Assuming UserDetails has YearOfBirth
            if (usersFilter.IsAdmin == true)
                query = query.Where(u => u.UserRoles.Any(ur => ur.RoleId == 1)); // Assuming RoleId 1 is Admin

            // Apply sorting
            if (usersFilter.OrderByAgeAsc.HasValue && usersFilter.OrderByAgeAsc.Value)
                query = query.OrderBy(u => u.UserDetails.Birthdate); // Assuming UserDetails has DateOfBirth
            else if (usersFilter.OrderByAgeAsc.HasValue && !usersFilter.OrderByAgeAsc.Value)
                query = query.OrderByDescending(u => u.UserDetails.Birthdate);

            if (usersFilter.OrderByCreationDateAsc.HasValue && usersFilter.OrderByCreationDateAsc.Value)
                query = query.OrderBy(u => u.CreatedAt);
            else if (usersFilter.OrderByCreationDateAsc.HasValue && !usersFilter.OrderByCreationDateAsc.Value)
                query = query.OrderByDescending(u => u.CreatedAt);

            // Calculate total count for pagination
            int totalItems = await query.CountAsync();

            // Apply pagination
            var pagedUsers = await query.Skip((currentPage - 1) * pageSize).Take(pageSize).ToListAsync();

            // Calculate total pages
            int totalPages = (int)Math.Ceiling(totalItems / (double)pageSize);

            // Create response
            PaginatedResponse<UserEntity> response = new PaginatedResponse<UserEntity>()
            {
                Items = pagedUsers,
                CurrentPage = currentPage,
                TotalPages = totalPages
            };

            return response;
        }

        public async Task<PaginatedResponse<UserEntity>> GetUsersBySubstringPaginated(int currentPage, int pageSize, string str)
        {
            var query = _dbSet
                .Include(u => u.Address).ThenInclude(a => a.City).ThenInclude(c => c.Country)
                .Include(u => u.UserRoles)
                .Include(u => u.UserDetails)
                .AsQueryable();

            if (!string.IsNullOrEmpty(str))
            {
                // Apply filter and prioritize usernames
                query = query.Where(u => u.Username.Contains(str) || u.Email.Contains(str))
                             .OrderByDescending(u => u.Username.Contains(str));
            }

            int totalItems = await query.CountAsync();

            var pagedUsers = await query.Skip((currentPage - 1) * pageSize).Take(pageSize).ToListAsync();

            int totalPages = (int)Math.Ceiling(totalItems / (double)pageSize);

            PaginatedResponse<UserEntity> response = new PaginatedResponse<UserEntity>()
            {
                Items = pagedUsers,
                CurrentPage = currentPage,
                TotalPages = totalPages
            };

            return response;
        }

        


        #endregion


    }
}
