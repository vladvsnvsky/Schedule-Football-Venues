using AutoMapper;
using FakeItEasy;
using FluentAssertions;
using MinifootballAppApi.DTOs;
using MinifootballAppApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MinifootballAppApi.Tests.Mapper
{
    public class AutoMapperTestingProfile : Profile
    {
        private readonly IMapper _mapper;
        public AutoMapperTestingProfile()
        {
            _mapper = A.Fake<IMapper>();
        }

        [Fact]
        public void MappingValidCityDTO_toCity()
        {
            CityDTO cityDTO = new CityDTO() { CountryId = 1, Name = "Bacau" };

            City expectedResult = new City() { CountryId = 1, Name = "Bacau" };

            City actualResult = _mapper.Map<City>(cityDTO);

            actualResult.Should().NotBeNull();
            actualResult.Should().BeEquivalentTo(expectedResult);
        }
    }
}
