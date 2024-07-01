using Microsoft.EntityFrameworkCore;
using MinifootballAppApi.Data;
using MinifootballAppApi.DTOs.Filters;
using MinifootballAppApi.Models;
using MinifootballAppApi.Repository.Interface;
using MinifootballAppApi.Utils;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace MinifootballAppApi.Repository
{
    public class MatchRepository : BaseRepository<Match>, IMatchRepository
    {
        public MatchRepository(MinifootballDbContext context) : base(context) { }

        public async Task<PaginatedResponse<Match>> GetAllByStartTimePaginatorAsync(int pageNumber, int pageSize)
        {
            try
            {
                var query = _dbSet
                    .OrderBy(match => match.StartTime)
                    .Skip((pageNumber - 1) * pageSize)
                    .Take(pageSize)
                    .Include(m => m.Organizer)
                    .Include(m => m.Field)
                        .ThenInclude(f => f.Address)
                        .ThenInclude(a => a.City)
                        .ThenInclude(c => c.Country);

                var items = await query.ToListAsync();
                var totalItems = await _dbSet.CountAsync();

                return new PaginatedResponse<Match>
                {
                    Items = items,
                    TotalPages = (int)Math.Ceiling(totalItems / (double)pageSize),
                    CurrentPage = pageNumber
                };
            }
            catch (Exception ex)
            {
                // Handle the exception or log it as needed
                throw;
            }
        }
        public async Task<PaginatedResponse<Match>> GetAllActiveByCityPaginatedAsync(int pageNumber, int pageSize, int cityId)
        {
            var query = _dbSet.Where(match => match.Field.Address.CityId == cityId && match.Cancelled == false && match.Finished == false)
                .OrderBy(match => match.StartTime)
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize)
                .Include(m => m.Organizer)
                .Include(m => m.Field)
                .ThenInclude(f => f.Address)
                .ThenInclude(a => a.City)
                .ThenInclude(c => c.Country);

            var items = await query.ToListAsync();
            var totalItems = await _dbSet.CountAsync(match => match.Field.Address.CityId == cityId);

            return new PaginatedResponse<Match>
            {
                Items = items,
                TotalPages = (int)Math.Ceiling(totalItems / (double)pageSize),
                CurrentPage = pageNumber
            };
        }


        public async Task<PaginatedResponse<Match>> GetAllByGameTypePaginatorAsync(int pageNumber, int pageSize, int nrOfPlayersRequired)
        {
            var query = _dbSet.Where(match => match.NrOfPlayersRequired == nrOfPlayersRequired)
                .OrderBy(match => match.StartTime)
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize)
                .Include(m => m.Organizer)
                .Include(m => m.Field)
                .ThenInclude(m => m.Address)
                .ThenInclude(m => m.City)
                .ThenInclude(m => m.Country);

            var items = await query.ToListAsync();
            var totalItems = await _dbSet.CountAsync(match => match.NrOfPlayersRequired == nrOfPlayersRequired);

            return new PaginatedResponse<Match>
            {
                Items = items,
                TotalPages = (int)Math.Ceiling(totalItems / (double)pageSize),
                CurrentPage = pageNumber
            };
        }

        public async Task<PaginatedResponse<Match>> GetAllActiveByStartTimePaginatorAsync(int pageNumber, int pageSize)
        {
            var query = _dbSet
                .Where(match => match.Cancelled != true && match.Finished != true)
                .OrderBy(match => match.StartTime)
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize)
                .Include(m => m.Organizer)
                .Include(m => m.Field)
                .ThenInclude(m => m.Address)
                .ThenInclude(m => m.City)
                .ThenInclude(m => m.Country);

            var items = await query.ToListAsync();
            var totalItems = await _dbSet.CountAsync(match => match.Cancelled != true && match.Finished != true);

            return new PaginatedResponse<Match>
            {
                Items = items,
                TotalPages = (int)Math.Ceiling(totalItems / (double)pageSize),
                CurrentPage = pageNumber
            };
        }

        public async Task<PaginatedResponse<Match>> GetAllActiveByGameTypePaginatorAsync(int pageNumber, int pageSize, int nrOfPlayersRequired)
        {
            var query = _dbSet
                .Where(match => match.Cancelled != true && match.Finished != true && match.NrOfPlayersRequired == nrOfPlayersRequired)
                .OrderBy(match => match.StartTime)
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize)
                .Include(m => m.Organizer)
                .Include(m => m.Field)
                .ThenInclude(m => m.Address)
                .ThenInclude(m => m.City)
                .ThenInclude(m => m.Country);

            var items = await query.ToListAsync();
            var totalItems = await _dbSet.CountAsync(match => match.Cancelled != true && match.Finished != true && match.NrOfPlayersRequired == nrOfPlayersRequired);

            return new PaginatedResponse<Match>
            {
                Items = items,
                TotalPages = (int)Math.Ceiling(totalItems / (double)pageSize),
                CurrentPage = pageNumber
            };
        }

        public async Task<PaginatedResponse<Match>> GetAllJoinableByStartTimePaginatorAsync(int pageNumber, int pageSize)
        {
            var query = _dbSet
                .Where(match => match.Cancelled != true && match.Finished != true && match.PlayerCanJoin == true)
                .OrderBy(match => match.StartTime)
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize)
                .Include(m => m.Organizer)
                .Include(m => m.Field)
                .ThenInclude(m => m.Address)
                .ThenInclude(m => m.City)
                .ThenInclude(m => m.Country);

            var items = await query.ToListAsync();
            var totalItems = await _dbSet.CountAsync(match => match.Cancelled != true && match.Finished != true && match.PlayerCanJoin == true);

            return new PaginatedResponse<Match>
            {
                Items = items,
                TotalPages = (int)Math.Ceiling(totalItems / (double)pageSize),
                CurrentPage = pageNumber
            };
        }

        public async Task<PaginatedResponse<Match>> GetAllJoinableByGameTypePaginatorAsync(int pageNumber, int pageSize, int nrOfPlayersRequired)
        {
            var query = _dbSet
                .Where(match => match.Cancelled != true && match.Finished != true && match.PlayerCanJoin == true && match.NrOfPlayersRequired == nrOfPlayersRequired)
                .OrderBy(match => match.StartTime)
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize)
                .Include(m => m.Organizer)
                .Include(m => m.Field)
                .ThenInclude(m => m.Address)
                .ThenInclude(m => m.City)
                .ThenInclude(m => m.Country);

            var items = await query.ToListAsync();
            var totalItems = await _dbSet.CountAsync(match => match.Cancelled != true && match.Finished != true && match.PlayerCanJoin == true && match.NrOfPlayersRequired == nrOfPlayersRequired);

            return new PaginatedResponse<Match>
            {
                Items = items,
                TotalPages = (int)Math.Ceiling(totalItems / (double)pageSize),
                CurrentPage = pageNumber
            };
        }

        // Other existing methods
        public async Task<ICollection<Match>> GetAllMatches()
        {
            var result = await _dbSet.Include(m => m.Organizer)
                .Include(m => m.Field)
                .ThenInclude(m => m.Address)
                .ThenInclude(m => m.City)
                .ThenInclude(m => m.Country)
                .Include(m => m.Field)
                .ToListAsync();
            return result;
        }

        public async Task<ICollection<Match>> GetAllActiveMatches()
        {
            var result = await _dbSet.Where(m => m.Cancelled == false && m.Finished == false).Include(m => m.Organizer)
                .Include(m => m.Field)
                .ThenInclude(m => m.Address)
                .ThenInclude(m => m.City)
                .ThenInclude(m => m.Country)
                .ToListAsync();
            return result;
        }

        public async Task<ICollection<Match>> GetByFieldIdAndTimeRangeAsync(int fieldId, DateTime startTime, DateTime endTime)
        {
            var result = await _dbSet.Include(m => m.Organizer)
                .Include(m => m.Field)
                .ThenInclude(m => m.Address)
                .ThenInclude(m => m.City)
                .ThenInclude(m => m.Country)
                .Where(m => m.FieldId == fieldId
                && !m.Cancelled
                && (m.StartTime < endTime && m.EndTime > startTime) || m.StartTime == startTime || m.EndTime == endTime).ToListAsync();
            return result;
        }

        public async Task<Match> GetMatchById(int param)
        {
            var result = await _dbSet.Include(m => m.Organizer)
                .Include(m => m.Field)
                .Include(m => m.Field)
                .ThenInclude(m => m.Address)
                .ThenInclude(m => m.City)
                .ThenInclude(m => m.Country)
                .FirstOrDefaultAsync(m => m.Id == param);
            return result;
        }

        public async Task<ICollection<Match>> GetMatchesByCity(int cityId)
        {
            var result = await _dbSet.Include(m => m.Organizer)
                    .Include(m => m.Field)
                    .ThenInclude(m => m.Address)
                    .ThenInclude(m => m.City)
                    .ThenInclude(m => m.Country)
                    .Where(m => m.Field.Address.CityId == cityId)
                    .ToListAsync();
            return result;
        }

        public async Task<ICollection<Match>> GetMatchesByCountry(int countryId)
        {
            var result = await _dbSet.Include(m => m.Organizer)
                    .Include(m => m.Field)
                    .ThenInclude(m => m.Address)
                    .ThenInclude(m => m.City)
                    .ThenInclude(m => m.Country)
                    .Where(m => m.Field.Address.City.CountryId == countryId)
                    .ToListAsync();
            return result;
        }

        public async Task<ICollection<Match>> GetMatchesByField(int fieldId)
        {
            var result = await _dbSet.Include(m => m.Organizer)
                .Include(m => m.Field)
                .ThenInclude(m => m.Address)
                .ThenInclude(m => m.City)
                .ThenInclude(m => m.Country)
                .Where(m => m.Field.Id == fieldId).ToListAsync();
            return result;
        }

        public async Task<ICollection<Match>> GetMatchesByOrganizerId(int organizerId)
        {
            var result = await _dbSet.Include(m => m.Organizer)
                .Include(m => m.Field)
                .ThenInclude(m => m.Address)
                .ThenInclude(m => m.City)
                .ThenInclude(m => m.Country)
                .Where(m => m.Organizer.Id == organizerId).ToListAsync();
            return result;
        }

        public async Task<ICollection<Match>> GetMatchesAtFieldByDay(int day, int month, int year, int fieldId)
        {
            DateTime date = new DateTime(year, month, day);
            var result = await _dbSet
                .Include(m => m.Field)
                .Where(m => m.FieldId == fieldId && m.StartTime.Date == date.Date)
                .ToListAsync();
            return result;
        }

        public async Task<PaginatedResponse<Match>> GetByMatchFiltersAsync(MatchFilters filters, int pageNumber, int pageSize)
        {
            var query = _dbSet.AsQueryable();

            if (filters.OrganizerId.HasValue)
                query = query.Where(m => m.OrganizerId == filters.OrganizerId.Value);

            if (filters.FieldId.HasValue)
                query = query.Where(m => m.FieldId == filters.FieldId.Value);

            if (filters.StartDateFrom.HasValue)
                query = query.Where(m => m.StartTime >= filters.StartDateFrom.Value);

            if (filters.StartDateTo.HasValue)
                query = query.Where(m => m.StartTime <= filters.StartDateTo.Value);

            if (filters.EndDateFrom.HasValue)
                query = query.Where(m => m.EndTime >= filters.EndDateFrom.Value);

            if (filters.EndDateTo.HasValue)
                query = query.Where(m => m.EndTime <= filters.EndDateTo.Value);

            if (filters.MinPlayersRequired.HasValue)
                query = query.Where(m => m.NrOfPlayersRequired >= filters.MinPlayersRequired.Value);

            if (filters.MaxPlayersRequired.HasValue)
                query = query.Where(m => m.NrOfPlayersRequired <= filters.MaxPlayersRequired.Value);

            if (filters.PlayerCanJoin.HasValue)
                query = query.Where(m => m.PlayerCanJoin == filters.PlayerCanJoin.Value);

            if (filters.Finished.HasValue)
                query = query.Where(m => m.Finished == filters.Finished.Value);

            if (filters.Cancelled.HasValue)
                query = query.Where(m => m.Cancelled == filters.Cancelled.Value);

            if (filters.CityId.HasValue)
                query = query.Where(m => m.Field.Address.CityId == filters.CityId.Value);

            if (filters.MinSpotsAvailable.HasValue)
                query = query.Where(m => m.NrOfPlayersRequired - m.CurrentNumberOfPlayers >= filters.MinSpotsAvailable.Value);

            if (filters.MaxSpotsAvailable.HasValue)
                query = query.Where(m => m.NrOfPlayersRequired - m.CurrentNumberOfPlayers <= filters.MaxSpotsAvailable.Value);

            var totalItems = await query.CountAsync();

            var items = await query
                .Include(m => m.Organizer)
        .Include(m => m.Field)
        .ThenInclude(m => m.Address)
        .ThenInclude(m => m.City)
        .ThenInclude(m => m.Country)
                .OrderBy(m => m.StartTime)
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

            var paginatedResponse = new PaginatedResponse<Match>
            {
                Items = items.ToList(),
                TotalPages = (int)Math.Ceiling(totalItems / (double)pageSize),
                CurrentPage = pageNumber
            };

            return paginatedResponse;
        }

    }
}
