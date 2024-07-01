using AutoMapper;
using MinifootballAppApi.DTOs.Create;
using MinifootballAppApi.DTOs.Update;
using MinifootballAppApi.Models;
using MinifootballAppApi.Services;

namespace MinifootballAppApi.DTOs
{
    public class MappingProfile : Profile
    {
        public MappingProfile() {
            CreateMap<Field, VenueDetailsDTO>()
            .ForMember(dest => dest.VenueId, opt => opt.MapFrom(src => src.Id))
            .ForMember(dest => dest.CityId, opt => opt.MapFrom(src => src.Address.CityId))
            .ForMember(dest => dest.CountryId, opt => opt.MapFrom(src => src.Address.City.CountryId))
            .ForMember(dest => dest.StreetAndNo, opt => opt.MapFrom(src => src.Address.StreetAndNo))
            .ForMember(dest => dest.CityName, opt => opt.MapFrom(src => src.Address.City.Name))
            .ForMember(dest => dest.CountryName, opt => opt.MapFrom(src => src.Address.City.Country.Name))
            .ForMember(dest => dest.Latitude, opt => opt.MapFrom(src => src.Address.Latitude))
            .ForMember(dest => dest.Longitude, opt => opt.MapFrom(src => src.Address.Longitude))
            .ReverseMap()
            .ForPath(dest => dest.Address.CityId, opt => opt.MapFrom(src => src.CityId))
            .ForPath(dest => dest.Address.City.CountryId, opt => opt.MapFrom(src => src.CountryId))
            .ForPath(dest => dest.Address.StreetAndNo, opt => opt.MapFrom(src => src.StreetAndNo))
            .ForPath(dest => dest.Address.City.Name, opt => opt.MapFrom(src => src.CityName))
            .ForPath(dest => dest.Address.City.Country.Name, opt => opt.MapFrom(src => src.CountryName))
            .ForPath(dest => dest.Address.Latitude, opt => opt.MapFrom(src => src.Latitude))
            .ForPath(dest => dest.Address.Longitude, opt => opt.MapFrom(src => src.Longitude))
            .ForPath(dest => dest.IsActive, opt => opt.MapFrom(src => src.IsActive));

            CreateMap<Country, CountryDTO>().ReverseMap();
            CreateMap<CreateCountryDTO, CountryDTO>().ReverseMap();
            CreateMap<Country, CreateCountryDTO>().ReverseMap();
            //-------------------------------------------------
            CreateMap<City, CityDTO>().ReverseMap();
            CreateMap<CreateCityDTO, CityDTO>().ReverseMap();
            CreateMap<City, CreateCityDTO>().ReverseMap();
            //-------------------------------------------------
            CreateMap<Address, AddressDTO>().ReverseMap();
            CreateMap<CreateAddressDTO, AddressDTO>().ReverseMap();
            CreateMap<Address, CreateAddressDTO>().ReverseMap();
            CreateMap<Address, UpdateAddressDTO>().ReverseMap();
            //-------------------------------------------------
            CreateMap<UserDetails, UserDetailsDTO>().ReverseMap();
            CreateMap<UserDetails, CreateUserDetailsDTO>().ReverseMap();
            CreateMap<UserDetailsDTO, CreateUserDetailsDTO>().ReverseMap();
            CreateMap<UserDetails, UpdateUserDetailsDTO>().ReverseMap();
            //-------------------------------------------------
            CreateMap<Role, RoleDTO>().ReverseMap();
            //-------------------------------------------------
            CreateMap<UserEntity, UserEntityDTO>().ReverseMap();
            CreateMap<UserEntity, CreateUserEntityDTO>().ReverseMap();
            CreateMap<UserEntityDTO, CreateUserEntityDTO>().ReverseMap();
            //-------------------------------------------------
            CreateMap<Match, MatchDTO>().ReverseMap();
            CreateMap<Match, CreateMatchDTO>().ReverseMap();
            CreateMap<Match, UpdateMatchDTO>().ReverseMap();
            //-------------------------------------------------
            CreateMap<UserRole, UserRoleDTO>().ReverseMap();
            //-------------------------------------------------
            CreateMap<UserMatch, UserMatchDTO>().ReverseMap();
            //-------------------------------------------------
            CreateMap<Field, FieldDTO>().ReverseMap();
            CreateMap<FieldDTO, CreateFieldDTO>().ReverseMap();
            CreateMap<Field, CreateFieldDTO>().ReverseMap();

            

            CreateMap<Match, GameDetailsDTO>()
            .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
            .ForMember(dest => dest.OrganizerId, opt => opt.MapFrom(src => src.OrganizerId))
            .ForMember(dest => dest.OrganizerName, opt => opt.MapFrom(src => src.Organizer.Username))
            .ForMember(dest => dest.FieldId, opt => opt.MapFrom(src => src.FieldId))
            .ForMember(dest => dest.FieldName, opt => opt.MapFrom(src => src.Field.Name))
            .ForMember(dest => dest.CityId, opt => opt.MapFrom(src => src.Field.Address.CityId))
            .ForMember(dest => dest.CityName, opt => opt.MapFrom(src => src.Field.Address.City.Name))
            .ForMember(dest => dest.CountryId, opt => opt.MapFrom(src => src.Field.Address.City.CountryId))
            .ForMember(dest => dest.CountryName, opt => opt.MapFrom(src => src.Field.Address.City.Country.Name))
            .ForMember(dest => dest.NrOfPlayersRequired, opt => opt.MapFrom(src => src.NrOfPlayersRequired))
            .ForMember(dest => dest.CurrentNumberOfPlayers, opt => opt.MapFrom(src => src.CurrentNumberOfPlayers))
            .ForMember(dest => dest.GameTypeName, opt => opt.MapFrom(src => $"{(src.NrOfPlayersRequired / 2)} a side"))
            .ForMember(dest => dest.MatchDurationInMinutes, opt => opt.MapFrom(src => 60))
            .ForMember(dest => dest.Finished, opt => opt.MapFrom(src => src.Finished))
            .ForMember(dest => dest.IsCancelled, opt => opt.MapFrom(src => src.Cancelled))
            .ForMember(dest => dest.CancellationReason, opt => opt.MapFrom(src => src.CancelledReason))
            .ForMember(dest => dest.PricePerPlayerUnits, opt => opt.MapFrom(src => src.PricePerPlayerUnits))
            .ForMember(dest => dest.Day, opt => opt.MapFrom(src => src.StartTime.Day))
            .ForMember(dest => dest.Month, opt => opt.MapFrom(src => src.StartTime.Month))
            .ForMember(dest => dest.Year, opt => opt.MapFrom(src => src.StartTime.Year))
            .ForMember(dest => dest.StartHour, opt => opt.MapFrom(src => src.StartTime.Hour))
            .ForMember(dest => dest.EndHour, opt => opt.MapFrom(src => src.EndTime.Hour));
        }
    }
        

    
}
