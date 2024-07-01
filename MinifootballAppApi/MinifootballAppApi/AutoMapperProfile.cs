using AutoMapper;
using MinifootballAppApi.DTOs;
using MinifootballAppApi.Models;

namespace MinifootballAppApi
{
    public class AutoMapperProfile : Profile
    {
        public AutoMapperProfile()
        {
            CreateMap<UserEntity, UserEntityDTO>();
            CreateMap<UserEntityDTO, UserEntity>();
        }
    }
}
