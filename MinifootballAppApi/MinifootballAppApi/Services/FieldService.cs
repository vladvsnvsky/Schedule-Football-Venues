using AutoMapper;
using Microsoft.CodeAnalysis.Operations;
using Microsoft.DotNet.Scaffolding.Shared.Messaging;
using MinifootballAppApi.DTOs;
using MinifootballAppApi.DTOs.Create;
using MinifootballAppApi.Exceptions;
using MinifootballAppApi.Models;
using MinifootballAppApi.Repository.Interface;
using MinifootballAppApi.Services.Interface;
using MinifootballAppApi.Utils;
using SQLitePCL;

namespace MinifootballAppApi.Services
{
    public class FieldService : IFieldService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public FieldService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        public async Task CreateAsync(CreateFieldDTO dto)
        {
            
            var field = _mapper.Map<Field>(dto);

            var address = new Address();
            address.CityId = dto.CityId;
            address.StreetAndNo = dto.StreetAndNo;
            address.Latitude = dto.GoogleMapsLatitude;
            address.Longitude = dto.GoogleMapsLongitude;

            field.Address = address;
            
            await _unitOfWork.FieldRepository.CreateAsync(field);
            await _unitOfWork.CompleteAsync();
        }


        public async Task<FieldDTO> UpdateAsync(int id, VenueDetailsDTO dto)
        {
            
            if(id < 0)
            {
                throw new InvalidDataException($"Invalid id {id}");
            }


            Field? venue = await _unitOfWork.FieldRepository.GetAsync(id);
            Address? address = await _unitOfWork.AddressRepository.GetAsync(venue.AddressId);

            address.StreetAndNo = dto.StreetAndNo;
            address.CityId = dto.CityId;
            address.Latitude = dto.Latitude;
            address.Longitude = dto.Longitude;
            await _unitOfWork.AddressRepository.UpdateAsync(address);
            await _unitOfWork.CompleteAsync();

            venue.Name = dto.Name;
            venue.AddressId = address.Id;
            venue.Email = dto.Email;
            venue.Width = (float)dto.Width;
            venue.Length = (float)dto.Length;
            venue.Description = dto.Description;
            venue.Phone = dto.Phone;
            venue.Capacity = dto.Capacity;
            venue.IsActive = dto.IsActive ?? false;
            venue.PricePerHourUnits = dto.PricePerHourUnits;
            await _unitOfWork.FieldRepository.UpdateAsync(venue);
            await _unitOfWork.CompleteAsync();

            Field fieldFromDb = await _unitOfWork.FieldRepository.GetAsync(venue.Id);
            FieldDTO fieldDTO = _mapper.Map<FieldDTO>(fieldFromDb);

            return fieldDTO;
        }

        public async Task DeleteAsync(int id)
        {

            var field = await _unitOfWork.FieldRepository.GetAsync(id);
            if (field is null)
                throw new InvalidDataException($"Invalid id {id}");

            await _unitOfWork.FieldRepository.DeleteAsync(field);
            await _unitOfWork.CompleteAsync();
        }

        public async Task<ICollection<TimeSpan>> GetAvailableHoursAtFieldByDay(int day, int month, int year, int fieldId)
        {
            try
            {
                DateTime date = new DateTime(year, month, day);

                var matchesByDay = await _unitOfWork.MatchRepository.GetMatchesAtFieldByDay(day, month, year, fieldId);

                TimeSpan openingTime = TimeSpan.FromHours(8);
                TimeSpan closingTime = TimeSpan.FromHours(23);

                List<TimeSpan> availableHours = new List<TimeSpan>();
                TimeSpan currentTime = openingTime;

                while (currentTime < closingTime)
                {
                    if (!matchesByDay.Any(m => m.StartTime.TimeOfDay <= currentTime && m.EndTime.TimeOfDay > currentTime))
                    {
                        availableHours.Add(currentTime);
                    }
                    currentTime = currentTime.Add(TimeSpan.FromHours(1));
                }

                return availableHours;
            }catch(Exception ex)
            {
                throw new Exception("Eroare in FieldService");
            }
        }

        public async Task<VenueDetailsDTO> GetDetailsByIdAsync(int id)
        {
            if (id < 0)
                throw new Exception($"Id {id} not valid!");

            var result = await _unitOfWork.FieldRepository.GetById(id);

            if (result == null)
            {
                throw new EntityNotFoundException($"Field with id {id} not found!");
            }

            var vd = ConvertToVenueDetails(result);

            return vd;
        }

        private VenueDetailsDTO ConvertToVenueDetails(Field field)
        {
            VenueDetailsDTO vd = _mapper.Map<VenueDetailsDTO>(field);

            return vd;
        }

        public async Task<ICollection<VenueDetailsDTO>> GetDetailsByCityIdAsync(int param)
        {
            if (param < 0)
                throw new InvalidDataException($"CityId {param} not valid!");

            var fields = await _unitOfWork.FieldRepository.GetAllFieldsAsync();
            var result = fields.Where(field => field.Address.CityId == param).ToList();

            if (result == null)
            {
                throw new EntityNotFoundException($"Field with CityId {param} not found!");
            }

            ICollection<VenueDetailsDTO> ret = new List<VenueDetailsDTO>();

            foreach (var item in result)
            {
                var listItem = ConvertToVenueDetails(item);
                ret.Add(listItem);
            }
            return ret;
        }

        public async Task<ICollection<VenueDetailsDTO>> GetAllDetails()
        {
            var result = await _unitOfWork.FieldRepository.GetAllFieldsAsync();
            ICollection<VenueDetailsDTO> ret = new List<VenueDetailsDTO>();
            foreach (var item in result)
            {
                var listItem = ConvertToVenueDetails(item);
                ret.Add(listItem);
            }
            return ret;
        }

        public async Task<ICollection<FieldDTO>> GetByCityIdAsync(int cityId)
        {
            // Fetch all fields from the repository
            var fields = await _unitOfWork.FieldRepository.GetAllFieldsAsync();

            // Filter fields by the given city ID and map to DTOs
            var fieldDTOs = fields
                .Where(field => field.Address.CityId == cityId)
                .Select(field => _mapper.Map<FieldDTO>(field))
                .ToList();

            return fieldDTOs;
        }

        public async Task<PaginatedResponse<VenueDetailsDTO>> GetAllFieldsByCityIdPaginatedAsync(int cityId, int pageNumber, int pageSize)
        {
            // Get the paginated fields from the repository
            var paginatedFields = await _unitOfWork.FieldRepository.GetAllFieldsByCityIdPaginatedAsync(cityId, pageNumber, pageSize);

            // Convert the fields to VenueDetailsDTO
            var venueDetailsList = paginatedFields.Items.Select(field => ConvertToVenueDetails(field)).ToList();

            // Create the paginated response
            var response = new PaginatedResponse<VenueDetailsDTO>
            {
                Items = venueDetailsList,
                CurrentPage = paginatedFields.CurrentPage,
                TotalPages = paginatedFields.TotalPages,
            };

            return response;
        }

        public async Task<FieldDTO> GetByIdAsync(int id)
        {
            Field field = await _unitOfWork.FieldRepository.GetAsync(id);

            if(field == null)
            {
                throw new Exception($"Field with id {id} doesn't exists!");
            }

            FieldDTO dto = _mapper.Map<FieldDTO>(field);
            return dto;
        }

        public async Task<ICollection<FieldDTO>> GetByCityId(int cityId)
        {
            ICollection<Field> fields = await _unitOfWork.FieldRepository.GetAllFieldsByCityId(cityId);

            ICollection<FieldDTO> dtos = fields.Select(f => _mapper.Map<FieldDTO>(f)).ToList();
            return dtos;
        }

        public async Task<UpdateRequestResponse<FieldDTO>> SetInactive(int fieldId)
        {
            try { 
            Field field = await _unitOfWork.FieldRepository.GetAsync(fieldId);
            if(field is null)
            {
                return new UpdateRequestResponse<FieldDTO>()
                {
                    Value = null,
                    Message = "Field not found!",
                    IsOk = false
                };
            }
            field.IsActive = false;
            await _unitOfWork.FieldRepository.UpdateAsync(field);
            await _unitOfWork.CompleteAsync();
            return new UpdateRequestResponse<FieldDTO>() {
                Value = _mapper.Map<FieldDTO>(field),
                Message = "Success!", 
                IsOk = true 
            };
            }catch(Exception ex)
            {
                return new UpdateRequestResponse<FieldDTO>()
                {
                    Value = null,
                    Message = ex.Message,
                    IsOk = true
                };
            }
        }

        public async Task<UpdateRequestResponse<FieldDTO>> SetActive(int fieldId)
        {
            try
            {
                Field field = await _unitOfWork.FieldRepository.GetAsync(fieldId);
                if (field is null)
                {
                    return new UpdateRequestResponse<FieldDTO>()
                    {
                        Value = null,
                        Message = "Field not found!",
                        IsOk = false
                    };
                }
                field.IsActive = true;
                await _unitOfWork.FieldRepository.UpdateAsync(field);
                await _unitOfWork.CompleteAsync();
                return new UpdateRequestResponse<FieldDTO>()
                {
                    Value = _mapper.Map<FieldDTO>(field),
                    Message = "Success!",
                    IsOk = true
                };
            }
            catch (Exception ex)
            {
                return new UpdateRequestResponse<FieldDTO>()
                {
                    Value = null,
                    Message = ex.Message,
                    IsOk = true
                };
            }
        }
    }
    
}
