using AutoMapper;
using MinifootballAppApi.DTOs;
using MinifootballAppApi.Exceptions;
using MinifootballAppApi.Models;
using MinifootballAppApi.Repository.Interface;
using MinifootballAppApi.Services.Interface;

namespace MinifootballAppApi.Services
{
    public class CityService : ICityService
    {
        private readonly IMapper _mapper;
        private readonly IUnitOfWork _unitOfWork;

        public CityService(IMapper mapper, IUnitOfWork unitOfWork)
        {
            this._mapper = mapper;
            this._unitOfWork = unitOfWork;
        }

        #region CREATE

        public async Task CreateAsync(CityDTO dto)
        {
            City city = new City();
            city.Name = dto.Name;
            city.CountryId = dto.CountryId;

            //apelez metoda create implementata in CityRepo
            await _unitOfWork.CityRepository.CreateAsync(city);
        }

        #endregion

        #region READ

        public async Task<CityDTO> GetByIdAsync(int param)
        {
            //metoda din Base Repository
            var result = await _unitOfWork.CityRepository.GetAsync(param);

            CityDTO dto = new CityDTO();
            dto.Name = result.Name;
            dto.CountryId = result.CountryId;

            return dto;
        }

        public async Task<ICollection<CityDTO>> GetAllAsync()
        {

            IEnumerable<City> cities = await _unitOfWork.CityRepository.GetAllAsync();

            var citiesDTO = new List<CityDTO>();

            foreach (var item in cities)
            {
                CityDTO dto = _mapper.Map<CityDTO>(item);
                citiesDTO.Add(dto);
            }
            return citiesDTO;
        }

        #endregion


        #region UPDATE

        public async Task<CityDTO> UpdateAsync(int id, CityDTO dto)
        {
            Country country = await _unitOfWork.CountryRepository.GetAsync(dto.CountryId);

            if(country is null)
            {
                throw new EntityCannotBeCreatedException("CountryId is not valid!");
            }

            City city = new City();
            city.Name = dto.Name;
            city.CountryId = dto.CountryId;
            city.Id = id;

            try
            {
                await _unitOfWork.CityRepository.UpdateAsync(city);
                return dto;
            }catch (Exception ex)
            {
                throw new EntityCannotBeCreatedException(ex.Message);
            }

        }

        #endregion


        #region DELETE
        public async Task DeleteAsync(int id)
        {
            City city = await _unitOfWork.CityRepository.GetAsync(id);
            if (city is not null)
            {
                try
                {
                    await _unitOfWork.CityRepository.DeleteAsync(city);
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
            }
            else throw new EntityNotFoundException("City with specified id not found!");

        }

        #endregion
    }
}
