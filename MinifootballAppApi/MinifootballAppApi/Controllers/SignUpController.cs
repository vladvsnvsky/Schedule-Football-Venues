using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MinifootballAppApi.DTOs;
using MinifootballAppApi.DTOs.Create;
using MinifootballAppApi.Services;
using MinifootballAppApi.Services.Interface.MinifootballAppApi.Services;

namespace MinifootballAppApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class SignUpController : ControllerBase
    {

        private readonly IUserService _userService;
        private readonly IMapper _mapper;

        public SignUpController(IUserService userService, IMapper mapper)
        {
            _userService = userService;
            _mapper = mapper;
        }

        [HttpPost("create-player")]
        public async Task<ActionResult<CreateUserEntityDTO>> CreateUser([FromBody] CreateUserEntityDTO dto)
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

        [HttpPost("create-player-from-list")]
        [Authorize(Roles = "ADMIN")]
        public async Task<ActionResult<List<CreateUserEntityDTO>>> CreateUser([FromBody] List<CreateUserEntityDTO> dto)
        {
            try
            {
                foreach(var entity in dto)
                    await _userService.CreateUser(entity);
                return Ok(dto);

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }




    }
}
