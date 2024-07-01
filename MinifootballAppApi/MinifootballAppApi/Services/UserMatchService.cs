using AutoMapper;
using MinifootballAppApi.Repository.Interface;
using MinifootballAppApi.Services.Interface;

namespace MinifootballAppApi.Services
{
    public class UserMatchService : IUserMatchService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public UserMatchService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        
    }
}
