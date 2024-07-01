using Hangfire;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MinifootballAppApi.DTOs;
using MinifootballAppApi.DTOs.Create;
using MinifootballAppApi.DTOs.Filters;
using MinifootballAppApi.DTOs.Update;
using MinifootballAppApi.Services.Interface;
using MinifootballAppApi.Utils;
using NuGet.Protocol;
using System.IdentityModel.Tokens.Jwt;

namespace MinifootballAppApi.Controllers
{
    [Authorize]
    [ApiController]
    [Route("[controller]")]
    public class MatchController : ControllerBase
    {
        private readonly IMatchService _matchService;
        private IBackgroundJobClient _backgroundJobClient;
        private IRecurringJobManager _recurringJobManager;

        public MatchController(IMatchService matchService, IRecurringJobManager recurringJobManager, IBackgroundJobClient backgroundJobClient)
        {
            _matchService = matchService;
            _recurringJobManager = recurringJobManager;
            _backgroundJobClient = backgroundJobClient;
        }

        // POST: api/match
        [HttpPost]
        public async Task<ActionResult> CreateMatch([FromBody] CreateMatchDTO matchDto)
        {
            try
            {
                var bearer_token = Request.Headers["Authorization"].ToString().Replace("Bearer ", "");
                var handler = new JwtSecurityTokenHandler();
                var jsonToken = handler.ReadToken(bearer_token) as JwtSecurityToken;

                var userId = jsonToken.Claims.First(claim => claim.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/sid").Value;
                matchDto.OrganizerId = int.Parse(userId);
                await _matchService.CreateAsync(matchDto);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // GET: api/match
        [HttpGet]
        public async Task<ActionResult<MatchDTO>> GetAllMatches()
        {
            var matches = await _matchService.GetAllAsync();
            return Ok(matches);
        }

        [HttpGet("active")]
        public async Task<ActionResult<ICollection<GameDetailsDTO>>> GetAllActiveMatches()
        {
            try
            {
                var matches = await _matchService.GetAllActiveAsync();
                return Ok(matches);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("match-details-by-id")]
        public async Task<ActionResult<GameDetailsDTO>> GetMatchDetailsById(int id)
        {
            try
            {
                return Ok(await _matchService.GetMatchDetailsById(id));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("active-by-city")]
        public async Task<ActionResult<ICollection<GameDetailsDTO>>> GetAllActiveMatchesByCity(int cityId)
        {
            try
            {
                var matches = await _matchService.GetAllActiveByCityAsync(cityId);
                return Ok(matches);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("by-filters")]
        public async Task<ActionResult<PaginatedResponse<GameDetailsDTO>>> GetAllActiveMatchesByCityPaginated([FromQuery] MatchFilters filters, int pageNumber, int pageSize)
        {
            try
            {
                var matches = await _matchService.GetByMatchFiltersAsync(filters, pageNumber, pageSize);
                return Ok(matches);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("active-by-city-paginated")]
        public async Task<ActionResult<PaginatedResponse<GameDetailsDTO>>> GetAllActiveMatchesByCityPaginated(int cityId, int pageNumber, int pageSize)
        {
            try
            {
                var matches = await _matchService.GetAllActiveByCityPaginatedAsync(cityId, pageNumber, pageSize);
                return Ok(matches);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("active-by-field")]
        public async Task<ActionResult<ICollection<GameDetailsDTO>>> GetAllActiveMatchesByField(int fieldId)
        {
            try
            {
                var matches = await _matchService.GetAllActiveByFieldAsync(fieldId);
                return Ok(matches);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("by-player")]
        public async Task<ActionResult<ICollection<GameDetailsDTO>>> GetMatchesByPlayer()
        {
            try
            {
                var bearer_token = Request.Headers["Authorization"].ToString().Replace("Bearer ", "");
                var handler = new JwtSecurityTokenHandler();
                var jsonToken = handler.ReadToken(bearer_token) as JwtSecurityToken;

                var userId = jsonToken.Claims.First(claim => claim.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/sid").Value;
                var matches = await _matchService.GetAllByPlayerAsync(int.Parse(userId));

                return Ok(matches);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


        [HttpGet("by-id")]
        public async Task<ActionResult<MatchDTO>> GetMatchById(int id)
        {
            var match = await _matchService.GetByIdAsync(id);
            if (match == null)
                return NotFound();

            return Ok(match);
        }

        [HttpPut("update-by-id")]
        public async Task<ActionResult<MatchDTO>> UpdateMatch(int id, [FromBody] UpdateMatchDTO matchDto)
        {
            var updatedMatch = await _matchService.UpdateAsync(id, matchDto);
            return Ok(updatedMatch);
        }

        // DELETE: api/match/{id}
        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteMatch(int id)
        {
            await _matchService.DeleteAsync(id);
            return Ok();
        }

        [HttpPut("join/{matchId}")]
        public async Task<ActionResult> JoinMatch(int matchId)
        {
            try
            {
                var bearer_token = Request.Headers["Authorization"].ToString().Replace("Bearer ", "");
                var handler = new JwtSecurityTokenHandler();
                var jsonToken = handler.ReadToken(bearer_token) as JwtSecurityToken;

                var userId = jsonToken.Claims.First(claim => claim.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/sid").Value;

                int uId = int.Parse(userId);

                await _matchService.PlayerJoinMatch(uId, matchId);

                return Ok($"Joined the match!");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPut("cancel")]
        public async Task<ActionResult> CancelMatch(int matchId, string cancelationReason)
        {
            try
            {
                var bearer_token = Request.Headers["Authorization"].ToString().Replace("Bearer ", "");
                var handler = new JwtSecurityTokenHandler();
                var jsonToken = handler.ReadToken(bearer_token) as JwtSecurityToken;

                var userId = jsonToken.Claims.First(claim => claim.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/sid").Value;

                int uId = int.Parse(userId);

                await _matchService.CancelMatch(matchId, cancelationReason, uId);

                return Ok($"Game has been cancelled!");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPut("leave")]
        public async Task<ActionResult> LeaveMatch(int matchId)
        {
            try
            {
                var bearer_token = Request.Headers["Authorization"].ToString().Replace("Bearer ", "");
                var handler = new JwtSecurityTokenHandler();
                var jsonToken = handler.ReadToken(bearer_token) as JwtSecurityToken;

                var userId = jsonToken.Claims.First(claim => claim.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/sid").Value;

                int uId = int.Parse(userId);

                await _matchService.LeaveMatch(matchId, uId);

                return Ok($"You left the game!");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("refresh-db-job")]
        [AllowAnonymous]
        public async Task<IActionResult> RefreshDBJob()
        {
            try
            {
                _recurringJobManager.AddOrUpdate(
                    "refreshDbJob",
                    () => _matchService.RefreshJob("Refresh matches", DateTime.Now.ToLongDateString()),
                    Cron.Minutely);

                return Ok("Recurring job scheduled.");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        [HttpGet("get-all-active-by-start-time-paginator")]
        public async Task<ActionResult<PaginatedResponse<GameDetailsDTO>>> GetAllActivePaginator(int pageNumber, int pageSize)
        {
            try
            {
                var result = await _matchService.GetAllActiveByStartTimePaginatorAsync(pageNumber, pageSize);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("active-by-player")]
        public async Task<ActionResult<PaginatedResponse<GameDetailsDTO>>> GetActiveMatchesByPlayer(int pageNumber, int pageSize)
        {
            try
            {
                var bearer_token = Request.Headers["Authorization"].ToString().Replace("Bearer ", "");
                var handler = new JwtSecurityTokenHandler();
                var jsonToken = handler.ReadToken(bearer_token) as JwtSecurityToken;

                var userId = jsonToken.Claims.First(claim => claim.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/sid").Value;
                var matches = await _matchService.GetAllActiveByPlayerPaginatorAsync(int.Parse(userId), pageNumber, pageSize);

                return Ok(matches);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("get-all-active-by-game-type-paginator")]
        public async Task<ActionResult<PaginatedResponse<GameDetailsDTO>>> GetAllActiveByGameTypePaginator(int pageNumber, int pageSize, int nrOfPlayers)
        {
            try
            {
                var result = await _matchService.GetAllActiveByGameTypePaginatorAsync(pageNumber, pageSize, nrOfPlayers);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("get-all-joinable-by-start-time-paginator")]
        public async Task<ActionResult<PaginatedResponse<GameDetailsDTO>>> GetAllJoinableByStartTimePaginator(int pageNumber, int pageSize)
        {
            try
            {
                var result = await _matchService.GetAllJoinableByStartTimePaginatorAsync(pageNumber, pageSize);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("get-all-joinable-by-game-type-paginator")]
        public async Task<ActionResult<PaginatedResponse<GameDetailsDTO>>> GetAllJoinableByGameTypePaginator(int pageNumber, int pageSize, int nrOfPlayers)
        {
            try
            {
                var result = await _matchService.GetAllJoinableByGameTypePaginatorAsync(pageNumber, pageSize, nrOfPlayers);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("get-all-by-start-time-paginator")]
        public async Task<ActionResult<PaginatedResponse<GameDetailsDTO>>> GetAllByStartTimePaginator(int pageNumber, int pageSize)
        {
            try
            {
                var result = await _matchService.GetAllByStartTimePaginatorAsync(pageNumber, pageSize);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("get-all-by-game-type-paginator")]
        public async Task<ActionResult<PaginatedResponse<GameDetailsDTO>>> GetAllByGameTypePaginator(int pageNumber, int pageSize, int nrOfPlayers)
        {
            try
            {
                var result = await _matchService.GetAllByGameTypePaginatorAsync(pageNumber, pageSize, nrOfPlayers);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

    }
}
