using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using MinifootballAppApi.DTOs;
using MinifootballAppApi.DTOs.Create;
using MinifootballAppApi.Exceptions;
using MinifootballAppApi.Services;
using MinifootballAppApi.Services.Interface;
using System.Transactions;

namespace MinifootballAppApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class CountryController : ControllerBase
    {
        private readonly ICountryService _countryService;
        private readonly IMapper _mapper;

        public CountryController(ICountryService countryService, IMapper mapper)
        {
            _countryService = countryService;
            _mapper = mapper;
        }

        [HttpPost("create")]
        public async Task<ActionResult<CountryDTO>> CreateCountry([FromBody] CreateCountryDTO dto)
        {
            try
            {
                var countryDTO = _mapper.Map<CountryDTO>(dto);
                await _countryService.CreateAsync(countryDTO);
                return Ok(dto);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("get/{id}")]
        public async Task<ActionResult<CountryDTO>> GetCountryById(int id)
        {
            try
            {
                var result = await _countryService.GetByIdAsync(id);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet]
        public async Task<ActionResult<List<CountryDTO>>> Index()
        {
            try
            {
                var countries = await _countryService.GetAllAsync();
                return Ok(countries);
            }
            catch (Exception ex)
            {
                // Log the exception
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPut("update/{id}")]
        public async Task<ActionResult<CountryDTO>> UpdateCountry(int id, [FromBody] CreateCountryDTO dto)
        {
            if (dto == null || dto.Name == null)
            {
                return BadRequest("CountryName data is invalid.");
            }

            try
            {
                var countryDTO = _mapper.Map<CountryDTO>(dto);
                var updateResult = await _countryService.UpdateAsync(id, countryDTO);

                if (updateResult == null)
                {
                    return NotFound($"CountryName with ID {id} not found.");
                }

                return Ok(updateResult); // Successfully updated
            }
            catch (Exception ex)
            {
                // Log the exception
                return StatusCode(500, ex.Message);
            }
        }

        [HttpDelete("delete/{id}")]
        public async Task<IActionResult> DeleteCountry(int id)
        {
            if (id <= 0)
            {
                return BadRequest("CountryName data is not valid.");
            }

            try
            {
                await _countryService.DeleteAsync(id);
                return Ok(); // Successfully updated
            }
            catch (Exception ex)
            {
                // Log the exception
                return StatusCode(500, ex.Message);
            }
        }
    }
}
