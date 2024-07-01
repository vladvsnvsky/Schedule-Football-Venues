using FakeItEasy;
using FluentAssertions;
using Microsoft.AspNetCore.Mvc;
using MinifootballAppApi.Controllers;
using MinifootballAppApi.DTOs;
using MinifootballAppApi.Services.Interface;


namespace MinifootballAppApi.Tests.Controller
{
    public class CityControllerTests
    {
        private readonly CityController _cityController;
        private readonly ICityService _cityService;

        public CityControllerTests()
        {
            _cityService = A.Fake<ICityService>();
            _cityController = new CityController(_cityService);
        }

        [Fact]
        public async Task CreateCity_WithValidData_ReturnsOkResult()
        {
            // Arrange
            var cityDto = new CityDTO { Name = "Balenciaga" };
            A.CallTo(() => _cityService.CreateAsync(cityDto)).Returns(Task.CompletedTask);

            // Act
            var result = await _cityController.CreateCity(cityDto);

            // Assert
            result.Should().BeOfType<OkObjectResult>();
            var okResult = result as OkObjectResult;
            okResult.Value.Should().BeEquivalentTo(cityDto);
        }

        [Fact]
        public async Task GetCityById_WithValidId_ReturnsOkResult()
        {
            // Arrange
            int testId = 1;
            var cityDto = new CityDTO { Name = "Balenciaga" };
            A.CallTo(() => _cityService.GetByIdAsync(testId)).Returns(cityDto);

            // Act
            var result = await _cityController.GetCityById(testId);

            // Assert
            result.Should().BeOfType<OkObjectResult>();
            var okResult = result as OkObjectResult;
            okResult.Value.Should().BeEquivalentTo(cityDto);
        }

        [Fact]
        public async Task UpdateCity_WithValidData_ReturnsUpdatedCity()
        {
            // Arrange
            int testId = 1;
            var cityDto = new CityDTO { Name = "Balenciaga" };
            A.CallTo(() => _cityService.UpdateAsync(testId, cityDto)).Returns(cityDto);

            // Act
            var result = await _cityController.UpdateCity(testId, cityDto);

            // Assert
            result.Should().BeOfType<OkObjectResult>();
            var okResult = result as OkObjectResult;
            okResult.Value.Should().BeEquivalentTo(cityDto);
        }

        [Fact]
        public async Task UpdateCity_WithNonExistingId_ReturnsNotFoundResult()
        {
            // Arrange
            int testId = 999; // non-existent ID
            var cityDto = new CityDTO { Name = "Balenciaga" };
            A.CallTo(() => _cityService.UpdateAsync(testId, cityDto)).Returns(Task.FromResult<CityDTO>(null));

            // Act
            var result = await _cityController.UpdateCity(testId, cityDto);

            // Assert
            result.Should().BeOfType<NotFoundObjectResult>();
            var notFoundResult = result as NotFoundObjectResult;

        }

        [Fact]
        public async Task DeleteCity_WithValidId_ReturnsOkResult()
        {
            // Arrange
            int testId = 1;
            A.CallTo(() => _cityService.DeleteAsync(testId)).Returns(Task.CompletedTask);

            // Act
            var result = await _cityController.DeleteCity(testId);

            // Assert
            result.Should().BeOfType<OkResult>();
        }

        [Fact]
        public async Task DeleteCity_WithNonExistingId_ReturnsNotFoundResult()
        {
            // Arrange
            int testId = 999; // non-existent ID
            A.CallTo(() => _cityService.DeleteAsync(testId)).Throws(new Exception("City with specified id not found!"));

            // Act
            var result =  await _cityController.DeleteCity(testId);

            // Assert
            result.Should().BeOfType<NotFoundObjectResult>();
        }


    }
}
