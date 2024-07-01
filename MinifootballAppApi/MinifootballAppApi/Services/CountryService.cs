using AutoMapper;
using MinifootballAppApi.DTOs;
using MinifootballAppApi.Exceptions;
using MinifootballAppApi.Models;
using MinifootballAppApi.Repository.Interface;
using MinifootballAppApi.Services.Interface;

namespace MinifootballAppApi.Services
{
    public class CountryService : ICountryService
    {
        private readonly IMapper _mapper;
        private readonly IUnitOfWork _unitOfWork;

        public CountryService(IMapper mapper, IUnitOfWork unitOfWork)
        {
            this._mapper = mapper;
            this._unitOfWork = unitOfWork;
        }

        public async Task CreateAsync(CountryDTO dto)
        {
            Country country = await _unitOfWork.CountryRepository.GetByName(dto.Name.ToUpper());

            if (country != null)
            {
                throw new Exception($"There is already a country with this name");
            }

            country = new Country { Name = dto.Name };
            country.Name = country.Name.ToUpper();
            
            await _unitOfWork.CountryRepository.CreateAsync(country);
            await _unitOfWork.CompleteAsync();
            
        }


        public async Task<CountryDTO> GetByIdAsync(int param)
        {
            
           var result = await _unitOfWork.CountryRepository.GetById(param);

           if (result == null)
               throw new Exception("Country with specified id not found!");

            CountryDTO dto = new CountryDTO();
            dto.Name = result.Name;
            dto.Id = result.Id;
            return dto;   
        }

        public async Task<ICollection<CountryDTO>> GetAllAsync()
        {

            IEnumerable<Country> countries = await _unitOfWork.CountryRepository.GetAllAsync();

            var countriesDTO = new List<CountryDTO>();

            foreach (var item in countries)
            {
                CountryDTO dto = new CountryDTO();
                dto.Name = item.Name;
                dto.Id = item.Id;
                countriesDTO.Add(dto);
            }
            return countriesDTO;
        }


        public async Task<CountryDTO> UpdateAsync(int id, CountryDTO dto)
        {
            Country inMemoryObj = await _unitOfWork.CountryRepository.GetById(id);
            if (inMemoryObj != null)
            {
                inMemoryObj.Name = dto.Name;

                await _unitOfWork.CountryRepository.UpdateAsync(inMemoryObj);
                await _unitOfWork.CompleteAsync();

                Country result = await _unitOfWork.CountryRepository.GetById(id);

                CountryDTO result_dto = new CountryDTO();
                result_dto.Name = result.Name;
                return result_dto;
            }
            else throw new Exception("Country with specified id not found!");
        }


        public async Task DeleteAsync(int id)
        {
            Country inMemoryObject = await _unitOfWork.CountryRepository.GetById(id);
            if (inMemoryObject != null)
            {
                await _unitOfWork.CountryRepository.DeleteAsync(inMemoryObject);
                await _unitOfWork.CompleteAsync();
            }
            else throw new Exception("Country with specified id not found!");
        }


    }
}
