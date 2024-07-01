using FakeItEasy;
using FluentAssertions;
using Humanizer;
using Microsoft.AspNetCore.Mvc;
using MinifootballAppApi.Controllers;
using MinifootballAppApi.DTOs.FieldDTOs;
using MinifootballAppApi.Services.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MinifootballAppApi.Tests.Controller
{
    public class FieldControllerTests
    {
        private IFieldService _fieldService;
        private FieldController _fieldController;

        public FieldControllerTests()
        {
            #region Dependencies
            _fieldService = A.Fake<IFieldService>();

            #endregion

            #region SUT
            _fieldController = new FieldController(_fieldService);
            #endregion
        }

        [Fact]
        public async Task CreateField_WhenCalledWithValidData_ReturnsOkResult()
        {
            //Arrange
            var dto = new CreateFieldDTO
            {
                Phone = "123-456-7890",
                Email = "example@email.com",
                Address = "123 Fantasy Lane",
                Name = "Greenfield Stadium",
                Description = "A spacious field suitable for various sports activities",
                Capacity = 500,
                Width = 68.5f, // Width in meters (standard soccer field width)
                Length = 105.0f, // Length in meters (standard soccer field length)
                PricePerHour = 100.0f, // Assuming the price per hour in some currency
                City = 1 // Assuming this represents a City ID in your system
            };

            A.CallTo(() => _fieldService.CreateField(dto)).DoesNothing();
            //Act
            var result = await _fieldController.CreateField(dto);

            //Assert
            result.Should().BeOfType<OkObjectResult>(); 
        }

        [Fact]
        public async Task CreateField_WhenCalledWithInvalidData_ReturnsOkResult()
        {
            //Arrange
            var invalidDTO = new CreateFieldDTO
            {
                Phone = "Invalid Phone Number", // Invalid format for a phone number
                Email = "invalid-email", // Invalid email format
                Address = "", // Empty address
                Name = "", // Empty name
                Description = null, // Null description (assuming it's required)
                Capacity = -10, // Negative capacity, which is typically invalid
                Width = -5.0f, // Negative width, which is typically invalid
                Length = -8.0f, // Negative length, which is typically invalid
                PricePerHour = -50.0f, // Negative price per hour, which is typically invalid
                City = 0 // Assuming 0 is an invalid city ID
            };

            A.CallTo(() => _fieldService.CreateField(invalidDTO)).Throws(new InvalidDataException());

            //Act
            var result = await _fieldController.CreateField(invalidDTO);

            //Assert

            result.Should().BeOfType<BadRequestObjectResult>();
        }

        [Fact]
        public async Task UpdateField_WhenCalledWithValidId_ReturnsOkResult()
        {
            //Arrange
            int id = 1;
            var updateFieldDto = new UpdateFieldDTO
            {
                Phone = "123-456-7890",
                Email = "example@email.com",
                Address = "123 Fantasy Lane",
                Name = "Greenfield Stadium",
                Description = "A spacious field suitable for various sports activities",
                Capacity = 500,
                Width = 68.5f, // Width in meters (standard soccer field width)
                Length = 105.0f, // Length in meters (standard soccer field length)
                PricePerHour = 100.0f, // Assuming the price per hour in some currency
                City = 1 // Assuming this represents a City ID in your system
            };

            var dto = new FieldDTO();

            var expectedResult = A.CallTo(() => _fieldService.UpdateField(id, updateFieldDto)).Returns(dto);

            //Act
            var actualResult = await _fieldController.UpdateField(id, updateFieldDto);

            //Assert
            actualResult.Should().BeOfType<OkObjectResult>();
        }

        [Fact]
        public async Task UpdateField_WhenCalledWithInvalidData_ReturnsOkResult()
        {
            //Arrange
            int id = 1;
            var invalidDTO = new UpdateFieldDTO
            {
                Phone = "Invalid Phone Number", // Invalid format for a phone number
                Email = "invalid-email", // Invalid email format
                Address = "", // Empty address
                Name = "", // Empty name
                Description = null, // Null description (assuming it's required)
                Capacity = -10, // Negative capacity, which is typically invalid
                Width = -5.0f, // Negative width, which is typically invalid
                Length = -8.0f, // Negative length, which is typically invalid
                PricePerHour = -50.0f, // Negative price per hour, which is typically invalid
                City = 0 // Assuming 0 is an invalid city ID
            };

            var dto = new FieldDTO();

            var expectedResult = A.CallTo(() => _fieldService.UpdateField(id, invalidDTO)).Throws(new InvalidDataException()); ;

            //Act
            var actualResult = await _fieldController.UpdateField(id, invalidDTO);

            //Assert
            actualResult.Should().BeOfType<BadRequestObjectResult>();
        }

        [Fact]
        public async Task UpdateField_WhenCalledWithInvalidId_ReturnsOkResult()
        {
            //Arrange
            int id = -1;
            var invalidDTO = new UpdateFieldDTO
            {
                Phone = "Invalid Phone Number", // Invalid format for a phone number
                Email = "invalid-email", // Invalid email format
                Address = "", // Empty address
                Name = "", // Empty name
                Description = null, // Null description (assuming it's required)
                Capacity = -10, // Negative capacity, which is typically invalid
                Width = -5.0f, // Negative width, which is typically invalid
                Length = -8.0f, // Negative length, which is typically invalid
                PricePerHour = -50.0f, // Negative price per hour, which is typically invalid
                City = 0 // Assuming 0 is an invalid city ID
            };

            var dto = new FieldDTO();

            var expectedResult = A.CallTo(() => _fieldService.UpdateField(id, invalidDTO)).Throws(new InvalidDataException()); ;

            //Act
            var actualResult = await _fieldController.UpdateField(id, invalidDTO);

            //Assert
            actualResult.Should().BeOfType<BadRequestObjectResult>();
        }

        [Fact]
        public async Task DeleteField_WhenCalledWithInvalidId_ThrowsBadRequest()
        {
            var id = -1;

            A.CallTo(() => _fieldService.DeleteAsync(id)).Throws(new InvalidDataException());

            var actualResult = await _fieldController.DeleteField(id);
            actualResult.Should().BeOfType<BadRequestObjectResult>();
        }
    }
}
