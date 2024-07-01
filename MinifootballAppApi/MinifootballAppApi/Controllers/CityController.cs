using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using MinifootballAppApi.DTOs;
using MinifootballAppApi.DTOs.Create;
using MinifootballAppApi.Services;
using MinifootballAppApi.Services.Interface;

namespace MinifootballAppApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class CityController : ControllerBase
    {
        private readonly ICityService _cityService;
        private readonly IMapper _mapper;

        public CityController(ICityService cityService, IMapper mapper)
        {
            _cityService = cityService;
            _mapper = mapper;
        }

        [HttpPost("create")]
        public async Task<ActionResult<CityDTO>> CreateCity([FromBody] CreateCityDTO dto)
        {
            try
            {
                CityDTO cityDTO = _mapper.Map<CityDTO>(dto);
                await _cityService.CreateAsync(cityDTO);
                return Ok(dto);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet]
        public async Task<ActionResult<List<CityDTO>>> Index()
        {
            try
            {
                var cities = await _cityService.GetAllAsync();
                return Ok(cities);
            }
            catch (Exception ex)
            {
                // Log the exception
                return StatusCode(500, ex.Message);
            }
        }

        [HttpGet("get-by-id")]
        public async Task<ActionResult<CityDTO>> GetCityById(int id)
        {
            if (id < 0)
                return BadRequest("Invalid id!");
            try
            {
                var result = await _cityService.GetByIdAsync(id);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPut("update")]
        public async Task<ActionResult<CityDTO>> UpdateCity(int id, CreateCityDTO dto)
        {
            try
            {
                var cityDTO = _mapper.Map<CityDTO>(dto);
                var updateResult = await _cityService.UpdateAsync(id, cityDTO);

                if (updateResult == null)
                {
                    return NotFound($"City with ID {id} not found.");
                }

                return Ok(updateResult); // Successfully updated
            }
            catch (Exception ex)
            {
                // Log the exception
                return StatusCode(500, ex.Message);
            }
        }

        [HttpDelete("delete")]
        public async Task<ActionResult> DeleteCity(int id)
        {
            if (id < 0)
            {
                return BadRequest("City data is null.");
            }

            try
            {
                await _cityService.DeleteAsync(id);
                return Ok(); // Successfully updated
            }
            catch (Exception ex)
            {
                // Log the exception
                return NotFound(ex.Message);
            }
        }
    }
}
