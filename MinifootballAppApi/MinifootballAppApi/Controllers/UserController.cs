
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MinifootballAppApi.DTOs;
using MinifootballAppApi.DTOs.Filters;
using MinifootballAppApi.DTOs.Update;
using MinifootballAppApi.Services;
using MinifootballAppApi.Services.Interface.MinifootballAppApi.Services;
using MinifootballAppApi.Utils;
using System.IdentityModel.Tokens.Jwt;


namespace MinifootballAppApi.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/[controller]")]
    public class UserController : ControllerBase
    {
        private readonly IUserService _userService;

        public UserController(IUserService userService)
        {
            _userService = userService;
        }
        
        [HttpGet("all")]
        public async Task<ActionResult<List<UserEntityDTO>>> Index()
        {

            try
            {
                var result = await _userService.GetAll();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("by-city-id")]
        [Authorize(Roles = "ADMIN")]
        public async Task<ActionResult<ICollection<UserEntityDTO>>> GetByCityId(int cityId)
        {
            try
            {
                ICollection<UserEntityDTO> result = await _userService.GetUsersByCityId(cityId);
                return Ok(result);
            }catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("search")]
        [Authorize(Roles = "ADMIN")]
        public async Task<ActionResult<PaginatedResponse<UserEntityDTO>>> Search(int currentPage, int pageSize, string str)
        {
            try
            {
                PaginatedResponse<UserEntityDTO> result = await _userService.GetUsersBySubstring(currentPage, pageSize, str);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


        [HttpGet("user-by-id")]
        public async Task<ActionResult<UserEntityDTO>> GetUserById(int id)
        {
            if (id < 0)
            {
                return BadRequest($"Invalid id {id}");
            }
            try
            {
                var result = await _userService.GetUserById(id);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("by-username")]
        public async Task<ActionResult<UserEntityDTO>> GetUserByUsername(string username)
        {
            try
            {
                var result = await _userService.GetUserByUsername(username);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("by-email")]
        public async Task<ActionResult<UserEntityDTO>> GetUserByEmail(string email)
        {
            try
            {
                var result = await _userService.GetUserByEmail(email);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("admins")]
        public async Task<ActionResult<ICollection<UserEntityDTO>>> GetAdmins()
        {
            try
            {
                ICollection<UserEntityDTO> result = await _userService.GetAdmins();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("banned-users")]
        public async Task<ActionResult<ICollection<UserEntityDTO>>> GetBannedUsers()
        {
            try
            {
                ICollection<UserEntityDTO> result = await _userService.GetBannedUsers();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("by-match")]
        public async Task<ActionResult<ICollection<UserEntityDTO>>> GetUsersByMatch(int matchId)
        {
            try
            {

                ICollection<UserEntityDTO> response = await _userService.GetByMatch(matchId);
                return Ok(response);

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("by-jwt")]
        public async Task<ActionResult<UserEntityDTO>> GetUserByToken()
        {
            try
            {
                var bearer_token = Request.Headers["Authorization"].ToString().Replace("Bearer ", "");
                var handler = new JwtSecurityTokenHandler();
                var jsonToken = handler.ReadToken(bearer_token) as JwtSecurityToken;

                var userId = jsonToken.Claims.First(claim => claim.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/sid").Value;

                var u = await _userService.GetUserById(int.Parse(userId));

                if (u == null)
                {
                    return NotFound();
                }

                return Ok(u);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("address-by-jwt")]
        public async Task<ActionResult<AddressDTO>> GetUserAddressByJWT()
        {
            try
            {
                var bearer_token = Request.Headers["Authorization"].ToString().Replace("Bearer ", "");
                var handler = new JwtSecurityTokenHandler();
                var jsonToken = handler.ReadToken(bearer_token) as JwtSecurityToken;

                var userId = jsonToken.Claims.First(claim => claim.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/sid").Value;

                var u = await _userService.GetUserAddressByJWT(bearer_token);

                if (u == null)
                {
                    return NotFound();
                }

                return Ok(u);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("details-by-jwt")]
        public async Task<ActionResult<UserDetailsDTO>> GetUserDetailsByJwt()
        {
            try
            {
                var bearer_token = Request.Headers["Authorization"].ToString().Replace("Bearer ", "");
                var handler = new JwtSecurityTokenHandler();
                var jsonToken = handler.ReadToken(bearer_token) as JwtSecurityToken;

                var userId = jsonToken.Claims.First(claim => claim.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/sid").Value;

                UserDetailsDTO result = await _userService.GetUserDetailsById(int.Parse(userId));

                return Ok(result);
            }
            catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("by-details-id")]
        public async Task<ActionResult<UserDetailsDTO>> GetUserDetailsById(int id)
        {
            try
            {
                var bearer_token = Request.Headers["Authorization"].ToString().Replace("Bearer ", "");
                var handler = new JwtSecurityTokenHandler();
                var jsonToken = handler.ReadToken(bearer_token) as JwtSecurityToken;

                var userId = jsonToken.Claims.First(claim => claim.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/sid").Value;

                if (userId == id.ToString() || jsonToken.Claims.Any(claim => claim.Value == "ADMIN"))
                {
                    var result = await _userService.GetUserDetailsById(id);
                    return Ok(result);
                }
                else
                    throw new Exception("Not authorized to do this action!");

            }
            catch(Exception ex)
            {
                return BadRequest(ex.Message) ;
            }
        }


        [HttpPut("update-user")]
        public async Task<ActionResult> UpdateUser(int id, UpdateUserEntityDTO dto)
        {
            if (dto == null)
            {
                return BadRequest("User data is null.");
            }

            try
            {
                var updateResult = await _userService.UpdateUser(id, dto);

                if (updateResult == null)
                {
                    return NotFound($"User with ID {id} not found.");
                }

                return Ok(updateResult); // Successfully updated
            }
            catch (Exception ex)
            {
                // Log the exception
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete("delete-user")]
        public async Task<ActionResult> DeleteUser(int id)
        {
            try
            {
                var bearer_token = Request.Headers["Authorization"].ToString().Replace("Bearer ", "");
                var handler = new JwtSecurityTokenHandler();
                var jsonToken = handler.ReadToken(bearer_token) as JwtSecurityToken;

                var userId = jsonToken.Claims.First(claim => claim.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/sid").Value;

                if (id == null)
                {
                    return BadRequest($"Invalid id {id}");
                }

                if (userId == id.ToString() || jsonToken.Claims.Any(claim => claim.Value == "ADMIN"))
                {
                    await _userService.DeleteUser(id);
                    return Ok(); // Successfully updated
                }
                else
                    throw new Exception("Not authorized to do this action!");


            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPut("ban-player")]
        public async Task<ActionResult> BanPlayer(int id)
        {
            try
            {
                var bearer_token = Request.Headers["Authorization"].ToString().Replace("Bearer ", "");
                var handler = new JwtSecurityTokenHandler();
                var jsonToken = handler.ReadToken(bearer_token) as JwtSecurityToken;

                var userId = jsonToken.Claims.First(claim => claim.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/sid").Value;

                if (id == null)
                {
                    return BadRequest($"Invalid id {id}");
                }

                if (jsonToken.Claims.Any(claim => claim.Value == "ADMIN"))
                {
                    await _userService.BanPlayer(id);
                    return Ok(); // Successfully updated
                }
                else
                    throw new Exception("Not authorized to do this action!");

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }

        [HttpPut("unban-player")]
        public async Task<ActionResult> UnbanPlayer(int id)
        {
            try
            {
                var bearer_token = Request.Headers["Authorization"].ToString().Replace("Bearer ", "");
                var handler = new JwtSecurityTokenHandler();
                var jsonToken = handler.ReadToken(bearer_token) as JwtSecurityToken;

                var userId = jsonToken.Claims.First(claim => claim.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/sid").Value;

                if (id == null)
                {
                    return BadRequest($"Invalid id {id}");
                }

                if (jsonToken.Claims.Any(claim => claim.Value == "ADMIN"))
                {
                    await _userService.UnbanPlayer(id);
                    return Ok(); // Successfully updated
                }
                else
                    throw new Exception("Not authorized to do this action!");

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }

        [HttpPut("set-admin")]
        public async Task<ActionResult> SetAdmin(int id)
        {
            try
            {
                var bearer_token = Request.Headers["Authorization"].ToString().Replace("Bearer ", "");
                var handler = new JwtSecurityTokenHandler();
                var jsonToken = handler.ReadToken(bearer_token) as JwtSecurityToken;

                var userId = jsonToken.Claims.First(claim => claim.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/sid").Value;

                if (id == null)
                {
                    return BadRequest($"Invalid id {id}");
                }

                if (jsonToken.Claims.Any(claim => claim.Value == "ADMIN"))
                {
                    await _userService.SetAdmin(id);
                    return Ok(); // Successfully updated
                }
                else
                    throw new Exception("Not authorized to do this action!");

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPut("remove-admin")]
        public async Task<ActionResult> RemoveAdmin(int id)
        {
            try
            {
                var bearer_token = Request.Headers["Authorization"].ToString().Replace("Bearer ", "");
                var handler = new JwtSecurityTokenHandler();
                var jsonToken = handler.ReadToken(bearer_token) as JwtSecurityToken;

                var userId = jsonToken.Claims.First(claim => claim.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/sid").Value;

                if (id == null)
                {
                    return BadRequest($"Invalid id {id}");
                }

                if (jsonToken.Claims.Any(claim => claim.Value == "ADMIN"))
                {
                    await _userService.RemoveAdmin(id);
                    return Ok(); // Successfully updated
                }
                else
                    throw new Exception("Not authorized to do this action!");

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPut("update-username")]
        [Authorize(Roles = "PLAYER, ADMIN")]
        public async Task<ActionResult<UpdateRequestResponse<UserEntityDTO>>> UpdateUsername(string username)
        {
            try
            {
                var bearer_token = Request.Headers["Authorization"].ToString().Replace("Bearer ", "");
                var handler = new JwtSecurityTokenHandler();
                var jsonToken = handler.ReadToken(bearer_token) as JwtSecurityToken;

                var userId = jsonToken.Claims.First(claim => claim.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/sid").Value;

                int id = int.Parse(userId);

                UpdateRequestResponse<UserEntityDTO> response = await _userService.UpdateUsernameAsync(username, id);

                return Ok(response);
            }catch(Exception ex)
            {
                UpdateRequestResponse<UserEntityDTO> response = new() { IsOk = false, Message = ex.Message };
                return BadRequest(response);
            }
        }

        [HttpPut("update-email")]
        [Authorize(Roles = "PLAYER, ADMIN")]
        public async Task<ActionResult<UpdateRequestResponse<UserEntityDTO>>> UpdateEmail(string email)
        {
            try
            {
                var bearerToken = Request.Headers["Authorization"].ToString().Replace("Bearer ", "");
                var handler = new JwtSecurityTokenHandler();
                var jsonToken = handler.ReadToken(bearerToken) as JwtSecurityToken;

                var userId = jsonToken.Claims.First(claim => claim.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/sid").Value;

                int id = int.Parse(userId);

                var response = await _userService.UpdateEmailAsync(email, id);

                return Ok(response);
            }
            catch (Exception ex)
            {
                var response = new UpdateRequestResponse<UserEntityDTO> { IsOk = false, Message = ex.Message };
                return BadRequest(response);
            }
        }

        [HttpPut("update-birthdate")]
        [Authorize(Roles = "PLAYER, ADMIN")]
        public async Task<ActionResult<UpdateRequestResponse<UserEntityDTO>>> UpdateBirthdate(int day, int month, int year)
        {
            try
            {
                var bearerToken = Request.Headers["Authorization"].ToString().Replace("Bearer ", "");
                var handler = new JwtSecurityTokenHandler();
                var jsonToken = handler.ReadToken(bearerToken) as JwtSecurityToken;

                var userId = jsonToken.Claims.First(claim => claim.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/sid").Value;

                int id = int.Parse(userId);

                var response = await _userService.UpdateBirthdateAsync(day, month, year, id);

                return Ok(response);
            }
            catch (Exception ex)
            {
                var response = new UpdateRequestResponse<UserEntityDTO> { IsOk = false, Message = ex.Message };
                return BadRequest(response);
            }
        }

        [HttpPut("update-password")]
        [Authorize(Roles = "PLAYER, ADMIN")]
        public async Task<ActionResult<UpdateRequestResponse<UserEntityDTO>>> UpdatePassword(string password)
        {
            try
            {
                var bearerToken = Request.Headers["Authorization"].ToString().Replace("Bearer ", "");
                var handler = new JwtSecurityTokenHandler();
                var jsonToken = handler.ReadToken(bearerToken) as JwtSecurityToken;

                var userId = jsonToken.Claims.First(claim => claim.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/sid").Value;

                int id = int.Parse(userId);

                var response = await _userService.UpdatePasswordAsync(password, id);

                return Ok(response);
            }
            catch (Exception ex)
            {
                var response = new UpdateRequestResponse<UserEntityDTO> { IsOk = false, Message = ex.Message };
                return BadRequest(response);
            }
        }

        [HttpPut("update-address")]
        [Authorize(Roles = "PLAYER, ADMIN")]
        public async Task<ActionResult<UpdateRequestResponse<UserEntityDTO>>> UpdateAddress(int cityId, string streetAndNo)
        {
            try
            {
                var bearerToken = Request.Headers["Authorization"].ToString().Replace("Bearer ", "");
                var handler = new JwtSecurityTokenHandler();
                var jsonToken = handler.ReadToken(bearerToken) as JwtSecurityToken;

                var userId = jsonToken.Claims.First(claim => claim.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/sid").Value;

                int id = int.Parse(userId);

                var response = await _userService.UpdateAddressAsync(cityId, streetAndNo, id);

                return Ok(response);
            }
            catch (Exception ex)
            {
                var response = new UpdateRequestResponse<UserEntityDTO> { IsOk = false, Message = ex.Message };
                return BadRequest(response);
            }
        }

        [HttpPut("update-phone-number")]
        [Authorize(Roles = "PLAYER, ADMIN")]
        public async Task<ActionResult<UpdateRequestResponse<UserEntityDTO>>> UpdatePhoneNumber(string phoneNumber)
        {
            try
            {
                var bearerToken = Request.Headers["Authorization"].ToString().Replace("Bearer ", "");
                var handler = new JwtSecurityTokenHandler();
                var jsonToken = handler.ReadToken(bearerToken) as JwtSecurityToken;

                var userId = jsonToken.Claims.First(claim => claim.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/sid").Value;

                int id = int.Parse(userId);

                var response = await _userService.UpdatePhoneNumberAsync(phoneNumber, id);

                return Ok(response);
            }
            catch (Exception ex)
            {
                var response = new UpdateRequestResponse<UserEntityDTO> { IsOk = false, Message = ex.Message };
                return BadRequest(response);
            }
        }

        [HttpGet("users-paginated")]
        [Authorize(Roles = "ADMIN")]
        public async Task<ActionResult<PaginatedResponse<UserEntityDTO>>> GetUsersPaginated(int currentPage, int pageSize, [FromQuery] UserFilter usersFilter = null)
        {
            try
            {

                PaginatedResponse<UserEntityDTO> response = await _userService.GetUsersPaginatedAsync(currentPage, pageSize, usersFilter);
                return response;

            }catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        




    }
}

