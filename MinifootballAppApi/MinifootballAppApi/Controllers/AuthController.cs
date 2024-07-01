using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MinifootballAppApi.Data.Enums;
using MinifootballAppApi.DTOs.Create;
using MinifootballAppApi.DTOs.Requests;
using MinifootballAppApi.Models.AuthModels;
using MinifootballAppApi.Services.Auth;
using MinifootballAppApi.Services.Interface.MinifootballAppApi.Services;
using NuGet.Packaging.Signing;

namespace MinifootballAppApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly IUserService _userService;
        public AuthController(IUserService userService)
        {
            _userService = userService;
        }

        [AllowAnonymous]
        [HttpPost("sign-up")]
        public async Task<ActionResult<CreateUserEntityDTO>> SignUp([FromBody] CreateUserEntityDTO dto)
        {
            try
            {
                await _userService.CreateUser(dto);
                return Ok(dto);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [AllowAnonymous]
        [HttpPost("admin-sign-in")]
        public async Task<ActionResult<string>> AdminSignIn(UserSignIn dto)
        {
            try
            {
                string token = await _userService.AdminSignIn(dto);
                if (token is not null)
                    return Ok(token);
                return Ok(null);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [AllowAnonymous]
        [HttpPost("sign-in")]
        public async Task<ActionResult<string>> SignIn([FromBody] UserSignIn dto)
        {
            try
            {
                var token = await _userService.SignIn(dto);
                return token;
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
            
        }

        [Authorize(Roles = nameof(RoleEnum.ADMIN))]
        [HttpPost("set-admin")]
        public async Task<ActionResult> CreateAdmin([FromBody] int userid)
        {
            try
            {
                await _userService.SetAdmin(userid);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
            return Ok();
        }

        [Authorize(Roles = nameof(RoleEnum.ADMIN))]
        [HttpPost("create-field-manager")]
        public async Task<ActionResult> CreateFieldManager([FromBody] int userid)
        {
            try
            {
                await _userService.CreateFieldManager(userid);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
            return Ok();
        }

        [AllowAnonymous]
        [HttpPost("check-by-email")]
        public async Task<ActionResult<bool>> UserExists([FromBody] EmailRequestDio request)
        {
            try
            {
                var res = await _userService.UserExists(request.Email);
                return Ok(res);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
