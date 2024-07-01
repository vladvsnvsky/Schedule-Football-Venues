using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using MinifootballAppApi.DTOs.Create;
using MinifootballAppApi.DTOs;
using MinifootballAppApi.Services;
using MinifootballAppApi.Services.Interface;
using MinifootballAppApi.Models;

namespace MinifootballAppApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AddressController : ControllerBase
    {
        private readonly IAddressService _addressService;
        private readonly IMapper _mapper;

        public AddressController(IAddressService addressService, IMapper mapper)
        {
            _addressService = addressService;
            _mapper = mapper;
        }

        [HttpPost("create-address")]
        public async Task<ActionResult<AddressDTO>> CreateAddress([FromBody] CreateAddressDTO dto)
        {
            try
            {
                AddressDTO addressDTO = _mapper.Map<AddressDTO>(dto);
                await _addressService.CreateAsync(addressDTO);
                return Ok(dto);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("get-all")]
        public async Task<ActionResult<List<AddressDTO>>> Index()
        {
            try
            {
                var addresses = await _addressService.GetAllAsync();
                return Ok(addresses);
            }
            catch (Exception ex)
            {
                // Log the exception
                return StatusCode(500, ex.Message);
            }
        }

        [HttpGet("get")]
        public async Task<ActionResult<AddressDTO>> GetAddressById(int id)
        {
            if (id < 0)
                return BadRequest("Invalid id!");
            try
            {
                var result = await _addressService.GetById(id);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("by-user-id")]
        public async Task<ActionResult<AddressDTO>> GetAddressByUserId(int id)
        {
            if (id < 0)
                return BadRequest("Invalid id!");
            try
            {
                var result = await _addressService.GetByUserIdAsync(id);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("by-venue-id")]
        public async Task<ActionResult<AddressDTO>> GetByFieldId(int id)
        {
            if (id < 0)
                return BadRequest("Invalid id!");
            try
            {
                var result = await _addressService.GetByFieldIdAsync(id);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPut("update")]
        public async Task<ActionResult<AddressDTO>> UpdateAddress(int id, [FromBody] CreateAddressDTO dto)
        {
            try
            {
                var addressDTO = _mapper.Map<AddressDTO>(dto);
                var updateResult = await _addressService.UpdateAsync(id, addressDTO);

                if (updateResult == null)
                {
                    return NotFound($"Address with ID {id} not found.");
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
        public async Task<ActionResult> DeleteAddress(int id)
        {
            if (id < 0)
            {
                return BadRequest("Address data is null.");
            }

            try
            {
                await _addressService.DeleteAsync(id);
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
