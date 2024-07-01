using FakeItEasy;
using FluentAssertions;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MinifootballAppApi.Controllers;
using MinifootballAppApi.DTOs;
using MinifootballAppApi.Services.Interface;
using Moq;

namespace MinifootballAppApi.Tests.Controller
{
    public class CountryControllerTests
    {
        private ICountryService _countryService;
        private CountryController _countryController;

        public CountryControllerTests()
        {
            #region Dependencies
            _countryService = A.Fake<ICountryService>();

            #endregion

            #region SUT
            _countryController = new CountryController(_countryService);
            #endregion
        }

        [Fact]
        public async Task CreateCountry_WhenCalled_ReturnsOkResult()
        {
            // Arrange
            var countryDto = new CountryDTO { Name = "Lituania" };
            A.CallTo(() => _countryService.CreateAsync(countryDto)).DoesNothing(); // Assuming it's a void method

            // Act
            var result = await _countryController.CreateCountry(countryDto);

            // Assert
            result.Should().BeOfType<OkObjectResult>();
            var okResult = result as OkObjectResult;
            okResult.Value.Should().BeEquivalentTo(countryDto);
        }

        [Fact]
        public async Task CreateCountry_WithInvalidData_ReturnsBadRequest()
        {
            // Arrange
            var countryDto = new CountryDTO { Name = null };
            A.CallTo(() => _countryService.CreateAsync(countryDto)).Throws(new Exception("Invalid data"));

            // Act
            var result = await _countryController.CreateCountry(countryDto);

            // Assert
            result.Should().BeOfType<BadRequestObjectResult>();
            var badRequestResult = result as BadRequestObjectResult;
            badRequestResult.Value.Should().Be("Invalid data");
        }


        [Fact]
        public async Task GetCountryById_WithExistingId_ReturnsOkResult()
        {
            // Arrange
            int testId = 1;
            var country = new CountryDTO { /* set properties */ };
            A.CallTo(() => _countryService.GetByIdAsync(testId)).Returns(country);

            // Act
            var result = await _countryController.GetCountryById(testId);

            // Assert
            result.Should().BeOfType<OkObjectResult>();
            var okResult = result as OkObjectResult;
            okResult.Value.Should().BeEquivalentTo(country);
        }

        [Fact]
        public async Task GetCountryById_WithNonExistentId_ReturnsBadRequest()
        {
            // Arrange
            int testId = 999; // non-existent ID
            A.CallTo(() => _countryService.GetByIdAsync(testId)).Throws(new Exception("Country not found"));

            // Act
            var result = await _countryController.GetCountryById(testId);

            // Assert
            result.Should().BeOfType<BadRequestObjectResult>();
            var badRequestResult = result as BadRequestObjectResult;
            badRequestResult.Value.Should().Be("Country not found");
        }

        [Fact]
        public async Task Index_WhenCalled_ReturnsAllCountries()
        {
            // Arrange
            var countries = new List<CountryDTO> { /* add some country objects */ };
            A.CallTo(() => _countryService.GetAllAsync()).Returns(countries);

            // Act
            var result = await _countryController.Index();

            // Assert
            result.Should().BeOfType<OkObjectResult>();
            var okResult = result as OkObjectResult;
            okResult.Value.Should().BeEquivalentTo(countries);
        }

        [Fact]
        public async Task UpdateCountry_WithValidData_ReturnsUpdatedCountry()
        {
            // Arrange
            int testId = 1;
            var countryDto = new CountryDTO { Name = "Estonia" };
            A.CallTo(() => _countryService.UpdateAsync(testId, countryDto)).Returns(countryDto); // Assuming it returns the updated object

            // Act
            var result = await _countryController.UpdateCountry(testId, countryDto);

            // Assert
            result.Should().BeOfType<OkObjectResult>();
            var okResult = result as OkObjectResult;
            okResult.Value.Should().BeEquivalentTo(countryDto);
        }

        [Fact]
        public async Task UpdateCountry_WithInvalidData_ReturnsBadRequest()
        {
            // Arrange
            int testId = 1;
            var countryDto = new CountryDTO { Name = null };
            A.CallTo(() => _countryService.UpdateAsync(testId, countryDto)).Throws(new Exception("UpdateAsync failed"));

            // Act
            var result = await _countryController.UpdateCountry(testId, countryDto);

            // Assert
            result.Should().BeOfType<BadRequestObjectResult>();
            var badRequestResult = result as BadRequestObjectResult;
            badRequestResult.Value.Should().Be("Country data is invalid.");
        }


        [Fact]
        public async Task DeleteCountry_WithValidId_ReturnsOkResult()
        {
            // Arrange
            int testId = 1;
            A.CallTo(() => _countryService.DeleteAsync(testId)).DoesNothing(); // Assuming it's a void method

            // Act
            var result = await _countryController.DeleteCountry(testId);

            // Assert
            result.Should().BeOfType<OkResult>();
        }

        [Fact]
        public async Task DeleteCountry_WithInvalidId_ReturnsBadRequest()
        {
            // Arrange
            int testId = -1; // invalid ID
            A.CallTo(() => _countryService.DeleteAsync(testId)).Throws(new Exception("Country data is not valid."));

            // Act
            var result = await _countryController.DeleteCountry(testId);

            // Assert
            result.Should().BeOfType<BadRequestObjectResult>();
            var badRequestResult = result as BadRequestObjectResult;
            badRequestResult.Value.Should().Be("Country data is not valid.");
        }





    }
}
