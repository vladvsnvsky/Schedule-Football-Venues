using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using MinifootballAppApi.DTOs;
using MinifootballAppApi.DTOs.Create;
using MinifootballAppApi.Services;
using MinifootballAppApi.Services.Interface;
using MinifootballAppApi.Utils;

namespace MinifootballAppApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class FieldController : ControllerBase
    {
        private readonly IFieldService _fieldService;
        private readonly IMapper _mapper;

        public FieldController(IFieldService fieldService, IMapper mapper)
        {
            _fieldService = fieldService;
            _mapper = mapper;
        }

        [HttpPost("create")]
        public async Task<ActionResult> CreateField([FromBody] CreateFieldDTO dto)
        {
            try
            {
                await _fieldService.CreateAsync(dto);
                return Ok(dto);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("get/{id}")]
        public async Task<ActionResult<FieldDTO>> GetFieldById(int id)
        {
            try
            {
                var result = await _fieldService.GetByIdAsync(id);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("venue-details-byid")]
        public async Task<ActionResult<VenueDetailsDTO>> GetVenueDetailsById(int id)
        {
            try
            {
                var result = await _fieldService.GetDetailsByIdAsync(id);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("get-by-city/{id}")]
        public async Task<ActionResult<ICollection<FieldDTO>>> GetByCityId(int id)
        {
            try
            {
                var result = await _fieldService.GetByCityId(id);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("get-by-city-paginated")]
        public async Task<ActionResult<PaginatedResponse<VenueDetailsDTO>>> GetByCityIdPaginated(int cityId, int pageNumber, int pageSize)
        {
            try
            {
                var result = await _fieldService.GetAllFieldsByCityIdPaginatedAsync(cityId, pageNumber, pageSize);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("venue-details")]
        public async Task<ActionResult<ICollection<VenueDetailsDTO>>> GetVenuesDetails()
        {
            try
            {
                var result = await _fieldService.GetAllDetails();
                return Ok(result);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        [HttpGet("venue-details-by-city-id")]
        public async Task<ActionResult<ICollection<VenueDetailsDTO>>> GetVenueDetailsByCityId(int id)
        {
            try
            {
                var result = await _fieldService.GetDetailsByCityIdAsync(id);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPut("update-by-id")]
        public async Task<ActionResult<FieldDTO>> UpdateField(int id, [FromBody] VenueDetailsDTO dto)
        {
            if (dto == null)
            {
                return BadRequest("Field data is null.");
            }

            try
            {
                var updateResult = await _fieldService.UpdateAsync(id, dto);

                if (updateResult == null)
                {
                    return NotFound($"Field with ID {id} not found.");
                }

                return Ok(updateResult); // Successfully updated
            }
            catch (Exception ex)
            {
                // Log the exception
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete("delete/{id}")]
        public async Task<ActionResult> DeleteField(int id)
        {
            if (id < 0)
            {
                return BadRequest($"Id {id} is invalid.");
            }

            try
            {
                await _fieldService.DeleteAsync(id);
                return Ok(); // Successfully updated
            }
            catch (Exception ex)
            {
                // Log the exception
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("available-hours")]
        public async Task<ActionResult<List<TimeSpan>>> GetAvailableHoursAtFieldByDay(int day, int month, int year, int fieldId)
        {
            try
            {
                var availableHours = await _fieldService.GetAvailableHoursAtFieldByDay(day, month, year, fieldId);
                return Ok(availableHours);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPut("set-active")]
        public async Task<UpdateRequestResponse<FieldDTO>> SetActive(int fieldId)
        {
            return await _fieldService.SetActive(fieldId);
        }

        [HttpPut("set-inactive")]
        public async Task<UpdateRequestResponse<FieldDTO>> SetInactive(int fieldId)
        {
            return await _fieldService.SetInactive(fieldId);
        }

    }
}
