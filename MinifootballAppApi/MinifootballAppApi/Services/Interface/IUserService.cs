using MinifootballAppApi.DTOs;
using MinifootballAppApi.DTOs.Create;
using MinifootballAppApi.DTOs.Filters;
using MinifootballAppApi.DTOs.Update;
using MinifootballAppApi.Models;
using MinifootballAppApi.Models.AuthModels;
using MinifootballAppApi.Utils;

namespace MinifootballAppApi.Services.Interface
{

    namespace MinifootballAppApi.Services
    {
        public interface IUserService
        {
            Task CreateUser(CreateUserEntityDTO userDTO);
            Task<ICollection<UserEntityDTO>> GetAll();
            Task<UserEntityDTO> GetUserById(int param);
            Task<UserDetailsDTO> GetUserDetailsById(int param);
            Task<UserEntityDTO> GetUserByUsername(string param);
            Task<UserEntityDTO> GetUserByEmail(string param);
            Task<UserEntityDTO> GetUserByJWT(string param);
            Task<ICollection<UserEntityDTO>> GetUsersByCityId(int cityId);
            Task<AddressDTO> GetUserAddressByJWT(string param);
            Task<UserEntityDTO> UpdateUser(int id, UpdateUserEntityDTO dto);
            Task<string> SignIn(UserSignIn dto);
            Task SetAdmin(int userid);
            Task CreateFieldManager(int userid);
            Task DeleteUser(int id);
            Task BanPlayer(int id);
            Task UnbanPlayer(int id);
            Task<bool> UserExists(string email);
            Task<ICollection<UserEntityDTO>> GetAdmins();
            Task<ICollection<UserEntityDTO>> GetBannedUsers();
            Task RemoveAdmin(int id);
            Task<string> AdminSignIn(UserSignIn dto);
            Task<UpdateRequestResponse<UserEntityDTO>> UpdateUsernameAsync(string username, int userId);
            Task<UpdateRequestResponse<UserEntityDTO>> UpdateEmailAsync(string email, int userId);
            Task<UpdateRequestResponse<UserEntityDTO>> UpdateBirthdateAsync(int day, int month, int year, int userId);
            Task<UpdateRequestResponse<UserEntityDTO>> UpdatePasswordAsync(string password, int userId);
            Task<UpdateRequestResponse<UserEntityDTO>> UpdateAddressAsync(int cityId, string streetAndNo, int userId);
            Task<UpdateRequestResponse<UserEntityDTO>> UpdatePhoneNumberAsync(string phoneNumber, int userId);
            Task<PaginatedResponse<UserEntityDTO>> GetUsersPaginatedAsync(int currentPage, int pageSize, UserFilter usersFilter = null);
            Task<PaginatedResponse<UserEntityDTO>> GetUsersBySubstring(int currentPage, int pageSize, string str);
            Task<ICollection<UserEntityDTO>> GetByMatch(int matchId);
        }
    }

}
