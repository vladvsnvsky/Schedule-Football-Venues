using AutoMapper;
using MinifootballAppApi.DTOs;
using MinifootballAppApi.Exceptions;
using MinifootballAppApi.Models;
using MinifootballAppApi.Repository.Interface;
using MinifootballAppApi.Services.Interface;

namespace MinifootballAppApi.Services
{
    public class AddressService : IAddressService
    {
        private readonly IMapper _mapper;
        private readonly IUnitOfWork _unitOfWork;

        public AddressService(IMapper mapper, IUnitOfWork unitOfWork)
        {
            _mapper = mapper;
            _unitOfWork = unitOfWork;
        }

        #region CREATE
        public async Task CreateAsync(AddressDTO dto)
        {
            Address address = _mapper.Map<Address>(dto);
            try
            {
                await _unitOfWork.AddressRepository.CreateAsync(address);
            }catch (Exception ex)
            {
                throw new EntityCannotBeCreatedException(ex.Message);
            }
        }
        #endregion

        #region READ

        public async Task<AddressDTO> GetById(int id)
        {
            var obj = await _unitOfWork.AddressRepository.GetByIdAsync(id);
            if (obj is null)
                throw new Exception("Address not found!");
            AddressDTO address = new()
            {
                Id = obj.Id,
                StreetAndNo = obj.StreetAndNo,
                CityId = obj.CityId,
                CityName = obj.City.Name,
                CountryName = obj.City.Country.Name,
                CountryId = obj.City.CountryId
            };


            return address;
        }
        public async Task<AddressDTO> GetByUserIdAsync(int param)
        {
            //metoda din Base Repository
            var user = await _unitOfWork.UserRepository.GetById(param);
            if (user == null)
                throw new Exception("User not found!");
            AddressDTO address = new()
            {
                Id = user.AddressId,
                StreetAndNo = user.Address.StreetAndNo,
                CityId = user.Address.CityId,
                CityName = user.Address.City.Name,
                CountryName = user.Address.City.Country.Name,
                CountryId = user.Address.City.CountryId
            };


            return address;
        }

        public async Task<AddressDTO> GetByFieldIdAsync(int id)
        {
            //metoda din Base Repository
            var field = await _unitOfWork.FieldRepository.GetById(id);
            if (field == null)
                throw new Exception("Field not found!");
            AddressDTO address = new()
            {
                Id = field.AddressId,
                StreetAndNo = field.Address.StreetAndNo,
                CityId = field.Address.CityId,
                CityName = field.Address.City.Name,
                CountryName = field.Address.City.Country.Name,
                CountryId = field.Address.City.CountryId,
                Latitude = field.Address.Latitude,
                Longitude = field.Address.Longitude,
            };


            return address;
        }

        public async Task<ICollection<AddressDTO>> GetAllAsync()
        {

            IEnumerable<Address> addresses = await _unitOfWork.AddressRepository.GetAllAsync();

            var addressesDTO = new List<AddressDTO>();

            foreach (var item in addresses)
            {
                AddressDTO dto = _mapper.Map<AddressDTO>(item);
                addressesDTO.Add(dto);
            }
            return addressesDTO;
        }
        #endregion

        #region UPDATE

        public async Task<AddressDTO> UpdateAsync(int id, AddressDTO dto)
        {
            City city = await _unitOfWork.CityRepository.GetAsync(dto.CityId);

            if (city is null)
            {
                throw new EntityCannotBeCreatedException("CityId is not valid!");
            }

            try
            {
                Address address = new Address();
                address.StreetAndNo = dto.StreetAndNo;
                address.CityId = dto.CityId;
                address.Latitude = dto.Latitude;
                address.Longitude = dto.Longitude;
                address.Id = id;
                await _unitOfWork.AddressRepository.UpdateAsync(address);
                await _unitOfWork.CompleteAsync();
                return dto;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }

        #endregion

        #region DELETE
        public async Task DeleteAsync(int id)
        {
            Address address = await _unitOfWork.AddressRepository.GetAsync(id);
            if (address is not null)
            {
                try
                {
                    await _unitOfWork.AddressRepository.DeleteAsync(address);
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
            }
            else throw new EntityNotFoundException("Address with specifiaed id not found!");

        }

        

        #endregion
    }
}
