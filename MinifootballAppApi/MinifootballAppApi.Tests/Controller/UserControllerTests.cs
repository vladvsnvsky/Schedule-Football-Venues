using FakeItEasy;
using FluentAssertions;
using Microsoft.AspNetCore.Mvc;
using MinifootballAppApi.Controllers;
using MinifootballAppApi.DTOs.UserDTOs;
using MinifootballAppApi.Services.Interface.MinifootballAppApi.Services;

namespace MinifootballAppApi.Tests.Controller
{
    public class UserControllerTests
    {
        private readonly UserController _userController;
        private readonly IUserService _userService;

        public UserControllerTests()
        {
            _userService = A.Fake<IUserService>();
            _userController = new UserController(_userService);
        }

        [Fact]
        public async Task TestGetUserById_ValidId()
        {
            // Arrange
            var fakeUserService = A.Fake<IUserService>();
            var userController = new UserController(fakeUserService);
            var expectedUser = new UserEntityDTO { Id = 1, Username = "testUser", Email = "test@example.com" };
            A.CallTo(() => fakeUserService.GetUserById(1)).Returns(expectedUser);

            // Act
            var actionResult = await userController.GetUserById(1);

            // Assert
            var okResult = Assert.IsType<OkObjectResult>(actionResult);
            var returnedUser = Assert.IsType<UserEntityDTO>(okResult.Value);
            Assert.Equal(expectedUser.Username, returnedUser.Username);
        }

        [Fact]
        public async Task TestGetUserById_InvalidId()
        {
            // Arrange
            var fakeUserService = A.Fake<IUserService>();
            var userController = new UserController(fakeUserService);

            // Act
            var actionResult = await userController.GetUserById(-1); // Assuming -1 is an invalid ID

            // Assert
            actionResult.Should().BeOfType<BadRequestObjectResult>();
        }



    }
}
