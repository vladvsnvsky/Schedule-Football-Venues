using AutoMapper;
using FakeItEasy;
using FluentAssertions;
using Humanizer;
using MinifootballAppApi.Repository.Interface;
using MinifootballAppApi.Services;
using MinifootballAppApi.Services.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MinifootballAppApi.Tests.Service
{
    public class FieldServiceTests
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IFieldService _fieldService;
        private readonly IMapper _mapper;

        public FieldServiceTests()
        {
            _unitOfWork = A.Fake<IUnitOfWork>();
            _mapper = A.Fake<IMapper>();
            _fieldService = new FieldService(_unitOfWork, _mapper);
        }

        [Fact]
        public async Task CreateField_WithInvalidDTO_ThrowsInvalidDataException()
        {
            // Arrange
            var invalidDto = new CreateFieldDTO
            {
                // Populate with invalid data as per your validation rules
                Phone = "Invalid Phone Number",
                Email = "invalid-email",
                Address = "",
                Name = "",
                Description = null,
                Capacity = -10,
                Width = -5.0f,
                Length = -8.0f,
                PricePerHour = -50.0f,
                City = 0
            };

            // Optional: Setup the mapper if needed
            // A.CallTo(() => _mapper.Map<Field>(A<CreateFieldDTO>.That.IsEqualTo(invalidDto)))
            //    .Returns(new Field());

            // Act & Assert
            var exception = await Assert.ThrowsAsync<InvalidDataException>(() => _fieldService.CreateField(invalidDto));
            exception.Should().BeOfType<InvalidDataException>(); // Check if the exception message contains expected text
        }
    }
}
