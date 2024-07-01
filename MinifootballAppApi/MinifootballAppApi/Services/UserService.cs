using AutoMapper;
using Microsoft.AspNetCore.SignalR;
using MinifootballAppApi.DTOs;
using MinifootballAppApi.DTOs.Create;
using MinifootballAppApi.DTOs.Filters;
using MinifootballAppApi.DTOs.Update;
using MinifootballAppApi.Hubs;
using MinifootballAppApi.Models;
using MinifootballAppApi.Models.AuthModels;
using MinifootballAppApi.Repository.Interface;
using MinifootballAppApi.Services.Auth;
using MinifootballAppApi.Services.Interface.MinifootballAppApi.Services;
using MinifootballAppApi.Utils;


namespace MinifootballAppApi.Services
{
    public class UserService : IUserService
    {
        private readonly IMapper _mapper;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IAuthService _authService;
        private readonly IHubContext<GameHub> _hubContext;
        public UserService(IHubContext<GameHub> hubContext, IMapper mapper, IUnitOfWork unitOfWork, IAuthService authService)
        {
            _mapper = mapper;
            _unitOfWork = unitOfWork;
            _authService = authService;
            _hubContext = hubContext;
        }

        public async Task CreateUser(CreateUserEntityDTO userDTO)
        {
            var checkUsername = await _unitOfWork.UserRepository.GetByUsername(userDTO.Username);

            if(checkUsername != null)
            {
                throw new Exception("Username can't be used! Try a different one!");
            }

            var checkEmail = await _unitOfWork.UserRepository.GetByEmail(userDTO.Email);

            if (checkEmail != null)
            {
                throw new Exception("An account related to this email address already exists!");
            }

            var userAddress = new Address()
            {
                CityId = userDTO.Address.CityId,
                StreetAndNo = userDTO.Address.StreetAndNo,
            };


            var userDetails = new UserDetails()
            {
                Phone = userDTO.UserDetails.Phone,
                Birthdate = new DateOnly(userDTO.UserDetails.BirthYear, userDTO.UserDetails.BirthMonth, userDTO.UserDetails.BirthDay),
            };

            var userEntity = new UserEntity
            {
                Username = userDTO.Username,
                Email = userDTO.Email,
                Password = PasswordHasher.HashPassword(userDTO.Password),
                Token = "",
                CreatedAt = DateTime.UtcNow,
                Address = userAddress,
                UserDetails = userDetails,
                IsBanned = false,
                UserRoles = new List<UserRole>(),
                OrganizedMatches = new List<Match>(),
                InvolvedMatches = new List<UserMatch>()
            };

            var userRole = new UserRole()
            {
                User = userEntity,
                RoleId = 2
            };

            userEntity.UserRoles.Add(userRole);

            try
            {
                await _unitOfWork.UserRepository.CreateAsync(userEntity);
                await _unitOfWork.CompleteAsync();

                var userFromDB = await _unitOfWork.UserRepository.GetByEmail(userDTO.Email);

                userFromDB.Token = _authService.GenerateToken(userFromDB);

                await _unitOfWork.UserRepository.UpdateAsync(userFromDB);
                await _unitOfWork.CompleteAsync();

                var returnDTO = _mapper.Map<UserEntityDTO>(userFromDB);
                await _hubContext.Clients.All.SendAsync("PlayerUpdated", returnDTO);

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public async Task SetAdmin(int userid)
        {
            var user = await _unitOfWork.UserRepository.GetById(userid);
            if(user is null)
            {
                throw new Exception($"User with {userid} not found!");
            }

            var roles = user.UserRoles.ToList();

            foreach (var role in roles)
            {
                if (role.RoleId == 1) {
                    throw new Exception("This user is already an admin!");
                }
            }
            var adminRole = new UserRole() { User = user, RoleId = 1 };
            user.UserRoles.Add(adminRole);
            user.Token = _authService.GenerateToken(user);
            await _unitOfWork.UserRepository.UpdateAsync(user);
            await _unitOfWork.CompleteAsync();
            var returnDTO = _mapper.Map<UserEntityDTO>(user);
            await _hubContext.Clients.All.SendAsync("PlayerUpdated", returnDTO);
        }

        public async Task CreateFieldManager(int userid)
        {

            var user = await _unitOfWork.UserRepository.GetById(userid);
            if (user is null)
            {
                throw new Exception($"User with {userid} not found!");
            }

            var roles = user.UserRoles.ToList();

            foreach (var role in roles)
            {
                if (role.RoleId == 3)
                {
                    throw new Exception("This user is already a field manager!");
                }
            }
            var fieldManagerRole = new UserRole() { User = user, RoleId = 3 };
            user.UserRoles.Add(fieldManagerRole);
            user.Token = _authService.GenerateToken(user);
            await _unitOfWork.UserRepository.UpdateAsync(user);
            await _unitOfWork.CompleteAsync();
            var returnDTO = _mapper.Map<UserEntityDTO>(user);
            await _hubContext.Clients.All.SendAsync("PlayerUpdated", returnDTO);
        }


        public async Task<ICollection<UserEntityDTO>> GetAll()
        {
            IEnumerable<UserEntity> users = await _unitOfWork.UserRepository.GetAllAsync();

            var usersDTO = new List<UserEntityDTO>();

            foreach (var item in users)
            {
                UserEntityDTO dto = _mapper.Map<UserEntityDTO>(item);
                usersDTO.Add(dto);
            }
            return usersDTO;

        }

        public async Task<UserEntityDTO> GetUserById(int param) 
        {
            var result = await _unitOfWork.UserRepository.GetById(param);

            var dto = _mapper.Map<UserEntityDTO>(result);

            return dto;
        }

        public async Task<UserDetailsDTO> GetUserDetailsById(int userId)
        {
            try
            {
                var user = await _unitOfWork.UserRepository.GetById(userId);

                if(user==null)
                {
                    throw new Exception("User not found!");
                }

                var details = user.UserDetails;
                UserDetailsDTO result = _mapper.Map<UserDetailsDTO>(details);
                return result;
            }catch(Exception ex)
            {
                throw ex;
            }
        }

        public async Task<UserEntityDTO> GetUserByJWT(string param)
        {
            var result = await _unitOfWork.UserRepository.GetByJWT(param);

            var dto = _mapper.Map<UserEntityDTO>(result);
            return dto;
        }

        public async Task<UserEntityDTO> GetUserByUsername(string param)
        {
            var result = await _unitOfWork.UserRepository.GetByUsername(param);
            if (result is null)
            {
                throw new Exception($"User with username {param} not found"!);
            }

            UserEntityDTO dto = _mapper.Map<UserEntityDTO>(result);

            return dto;
        }

        public async Task<UserEntityDTO> GetUserByEmail(string param)
        {
            UserEntity result = await _unitOfWork.UserRepository.GetByEmail(param);
            if (result is null)
            {
                throw new Exception($"User with email {param} not found"!);
            }

            UserEntityDTO dto = _mapper.Map<UserEntityDTO>(result);

            return dto;
        }

        public async Task<bool> UserExists(string email)
        {
            var result = await _unitOfWork.UserRepository.GetByEmail(email);
            if (result is null)
            {
                return false;
            }
            return true;
        }

        public async Task<UserEntityDTO> UpdateUser(int id, UpdateUserEntityDTO dto)
        {
            try
            {
                UserEntity inMemoryObject = await _unitOfWork.UserRepository.GetById(id);
                if (inMemoryObject == null)
                    throw new Exception($"User with id {id} not found!");
                {
                    if (dto.Username != null)
                        inMemoryObject.Username = dto.Username;

                    if (dto.Address != null)
                    {
                        inMemoryObject.Address.CityId = dto.Address.CityId;
                        inMemoryObject.Address.StreetAndNo = dto.Address.StreetAndNo;
                    }

                    if (dto.UserDetails != null)
                    {
                        inMemoryObject.UserDetails.Birthdate = new DateOnly(dto.UserDetails.BirthYear, dto.UserDetails.BirthMonth, dto.UserDetails.BirthDay);
                        inMemoryObject.UserDetails.Phone = dto.UserDetails.Phone;
                    }

                    inMemoryObject.Token = _authService.GenerateToken(inMemoryObject);

                    await _unitOfWork.UserRepository.UpdateAsync(inMemoryObject);
                    await _unitOfWork.CompleteAsync();


                    UserEntity result = await _unitOfWork.UserRepository.GetById(id);

                    UserEntityDTO result_dto = _mapper.Map<UserEntityDTO>(result);
                    await _hubContext.Clients.All.SendAsync("PlayerUpdated", result_dto);

                    return result_dto;
                }
            }catch(Exception ex)
            {
                throw ex;
            }
            
        }

        public async Task DeleteUser(int id)
        {
            UserEntity inMemoryObject = await _unitOfWork.UserRepository.GetById(id);
            if(inMemoryObject != null)
            {
                var userActiveGames = await _unitOfWork.UserMatchRepository.GetMatchesByPlayerId(id);
                foreach(var match in userActiveGames)
                {
                    if(match.Finished != true || match.Cancelled != true)
                    {
                        throw new Exception("You cannot remove a player involved in an active match! You can ban him instead to prevent him joining other games in the future!");
                    }
                }
                await _unitOfWork.UserRepository.DeleteAsync(inMemoryObject);
                await _unitOfWork.CompleteAsync();
            }
            else throw new Exception($"User with id {id} not found!");
        }

        public async Task BanPlayer(int id)
        {
            try
            {
                UserEntity inMemoryObject = await _unitOfWork.UserRepository.GetById(id);
                if (inMemoryObject == null)
                    throw new Exception($"User with id {id} not found!");

                if (inMemoryObject.IsBanned == true)
                    throw new Exception("This player is already banned!");

                inMemoryObject.IsBanned = true;
                await _unitOfWork.UserRepository.UpdateAsync(inMemoryObject);
                await _unitOfWork.CompleteAsync();
                var returnDTO = _mapper.Map<UserEntityDTO>(inMemoryObject);
                await _hubContext.Clients.All.SendAsync("PlayerUpdated", returnDTO);

            }
            catch(Exception ex)
            {
                throw ex;
            } 
        }

        public async Task UnbanPlayer(int id)
        {
            try
            {
                UserEntity inMemoryObject = await _unitOfWork.UserRepository.GetById(id);
                if (inMemoryObject == null)
                    throw new Exception($"User with id {id} not found!");

                if (inMemoryObject.IsBanned == false)
                    throw new Exception("This player is not banned!");

                inMemoryObject.IsBanned = false;
                await _unitOfWork.UserRepository.UpdateAsync(inMemoryObject);
                await _unitOfWork.CompleteAsync();
                var returnDTO = _mapper.Map<UserEntityDTO>(inMemoryObject);
                await _hubContext.Clients.All.SendAsync("PlayerUpdated", returnDTO);
            }
            catch(Exception ex)
            {
                throw ex;
            }
            
        }


        public async Task<string> SignIn(UserSignIn dto)
        {
            string email = dto.Email;
            string password = dto.Password;

            var userInDB = await _unitOfWork.UserRepository.GetByEmail(email);

            if(userInDB != null)
            {
                bool passwordCheck = PasswordHasher.verifyPassword(dto.Password, userInDB.Password);
                if(passwordCheck)
                {
                    return userInDB.Token;
                }
            }
            return null;
        }

        public async Task<AddressDTO> GetUserAddressByJWT(string param)
        {
            var result = await _unitOfWork.UserRepository.GetByJWT(param);

            #region Mapping DTO to User
            var address = result.Address;
            var addressDTO = _mapper.Map<AddressDTO>(address);
            #endregion
            return addressDTO;
        }

        public async Task<ICollection<UserEntityDTO>> GetUsersByCityId(int cityId)
        {
            ICollection<UserEntity> resultFromDB = await _unitOfWork.UserRepository.GetByCityId(cityId);
            ICollection<UserEntityDTO> resultAsDTOs = new List<UserEntityDTO>();
            foreach (var item in resultFromDB)
            {
                resultAsDTOs.Add(_mapper.Map<UserEntityDTO>(item));
            }
            return resultAsDTOs;
        }

        public async Task<ICollection<UserEntityDTO>> GetAdmins()
        {
            ICollection<UserEntity> resultFromDB = await _unitOfWork.UserRepository.GetAdmins();
            ICollection<UserEntityDTO> resultAsDTOs = new List<UserEntityDTO>();
            foreach (var item in resultFromDB)
            {
                resultAsDTOs.Add(_mapper.Map<UserEntityDTO>(item));
            }
            return resultAsDTOs;
        }

        public async Task<ICollection<UserEntityDTO>> GetBannedUsers()
        {

            ICollection<UserEntity> resultFromDB = await _unitOfWork.UserRepository.GetBannedUsers();
            ICollection<UserEntityDTO> resultAsDTOs = new List<UserEntityDTO>();
            foreach (var item in resultFromDB)
            {
                resultAsDTOs.Add(_mapper.Map<UserEntityDTO>(item));
            }
            return resultAsDTOs;
        }

        public async Task RemoveAdmin(int id)
        {
            UserEntity adminFromDB = await _unitOfWork.UserRepository.GetById(id);
            if(adminFromDB == null)
            {
                throw new Exception("User not found!");
            }
            var adminRole = adminFromDB.UserRoles.FirstOrDefault(role => role.RoleId == 1);

            if (adminRole != null)
            {
                adminFromDB.UserRoles.Remove(adminRole);
                adminFromDB.Token = _authService.GenerateToken(adminFromDB);
                await _unitOfWork.UserRepository.UpdateAsync(adminFromDB);
                await _unitOfWork.CompleteAsync();
                var returnDTO = _mapper.Map<UserEntityDTO>(adminFromDB);
                await _hubContext.Clients.All.SendAsync("PlayerUpdated", returnDTO);
                return;
            }

            throw new Exception("This user is not an admin!");

        }

        public async Task<bool> CheckAdmin(UserEntity user)
        {
            var adminRole = user.UserRoles.FirstOrDefault(role => role.RoleId == 1);
            if (adminRole == null)
            {
                return false;
            }
            return true;
        }

        public async Task<string> AdminSignIn(UserSignIn dto)
        {
            string email = dto.Email;
            string password = dto.Password;

            var userInDB = await _unitOfWork.UserRepository.GetByEmail(email);

            if (userInDB != null)
            {
                bool passwordCheck = PasswordHasher.verifyPassword(dto.Password, userInDB.Password);
                if (passwordCheck)
                {
                    var adminRole = userInDB.UserRoles.FirstOrDefault(role => role.RoleId == 1);
                    if (adminRole != null)
                    {
                        return userInDB.Token!;
                    }
                }
            }
            return null;
        }

        public async Task<UpdateRequestResponse<UserEntityDTO>> UpdateUsernameAsync(string username, int userId)
        {
            UserEntity userFromDB = await _unitOfWork.UserRepository.GetByUsername(username);
            if (userFromDB != null)
                if(userFromDB.Id != userId)
                {
                    return new UpdateRequestResponse<UserEntityDTO>() { IsOk = false, Message = "This username already exists!", Value = null };
                }
                else
                {
                    return new UpdateRequestResponse<UserEntityDTO>() { IsOk = false, Message = "You have already set this username!", Value = null };
                }

            userFromDB = await _unitOfWork.UserRepository.GetById(userId);
            userFromDB.Username = username;
            userFromDB.Token = _authService.GenerateToken(userFromDB);
            await _unitOfWork.UserRepository.UpdateAsync(userFromDB);
            await _unitOfWork.CompleteAsync();
            userFromDB = await _unitOfWork.UserRepository.GetById(userId);

            await _hubContext.Clients.All.SendAsync("PlayerUpdated", userFromDB);
            return new UpdateRequestResponse<UserEntityDTO>() { IsOk = true, Message = "Success", Value = _mapper.Map<UserEntityDTO>(userFromDB), JWT = userFromDB.Token };
            
        }

        public async Task<UpdateRequestResponse<UserEntityDTO>> UpdateEmailAsync(string email, int userId)
        {
            UserEntity userFromDB = await _unitOfWork.UserRepository.GetByEmail(email);
            if (userFromDB != null)
                if (userFromDB.Id != userId)
                {
                    return new UpdateRequestResponse<UserEntityDTO>() { IsOk = false, Message = "This email already exists!", Value = null };
                }
                else
                {
                    return new UpdateRequestResponse<UserEntityDTO>() { IsOk = false, Message = "You have already set this email!", Value = null };
                }

            userFromDB = await _unitOfWork.UserRepository.GetById(userId);
            userFromDB.Email = email;
            userFromDB.Token = _authService.GenerateToken(userFromDB);
            await _unitOfWork.UserRepository.UpdateAsync(userFromDB);
            await _unitOfWork.CompleteAsync();
            userFromDB = await _unitOfWork.UserRepository.GetById(userId);

            await _hubContext.Clients.All.SendAsync("PlayerUpdated", userFromDB);
            return new UpdateRequestResponse<UserEntityDTO>() { IsOk = true, Message = "Success", Value = _mapper.Map<UserEntityDTO>(userFromDB), JWT = userFromDB.Token };
        }

        public async Task<UpdateRequestResponse<UserEntityDTO>> UpdateBirthdateAsync(int day, int month, int year, int userId)
        {
            UserEntity userFromDB = await _unitOfWork.UserRepository.GetById(userId);
            userFromDB.UserDetails.Birthdate = new DateOnly(year, month, day);
            await _unitOfWork.UserRepository.UpdateAsync(userFromDB);
            await _unitOfWork.CompleteAsync();

            await _hubContext.Clients.All.SendAsync("PlayerUpdated", userFromDB);
            return new UpdateRequestResponse<UserEntityDTO>() { IsOk = true, Message = "Success", Value = _mapper.Map<UserEntityDTO>(userFromDB), JWT = userFromDB.Token };
        }

        public async Task<UpdateRequestResponse<UserEntityDTO>> UpdatePasswordAsync(string password, int userId)
        {
            UserEntity userFromDB = await _unitOfWork.UserRepository.GetById(userId);
            userFromDB.Password = PasswordHasher.HashPassword(password);
            userFromDB.Token = _authService.GenerateToken(userFromDB);
            await _unitOfWork.UserRepository.UpdateAsync(userFromDB);
            await _unitOfWork.CompleteAsync();

            await _hubContext.Clients.All.SendAsync("PlayerUpdated", userFromDB);

            return new UpdateRequestResponse<UserEntityDTO>() { IsOk = true, Message = "Success", Value = _mapper.Map<UserEntityDTO>(userFromDB), JWT = userFromDB.Token };
        }

        public async Task<UpdateRequestResponse<UserEntityDTO>> UpdateAddressAsync(int cityId, string streetAndNo, int userId)
        {
            UserEntity userFromDB = await _unitOfWork.UserRepository.GetById(userId);
            userFromDB.Address.CityId = cityId;
            userFromDB.Address.StreetAndNo = streetAndNo;
            await _unitOfWork.UserRepository.UpdateAsync(userFromDB);
            await _unitOfWork.CompleteAsync();

            await _hubContext.Clients.All.SendAsync("PlayerUpdated", userFromDB);

            return new UpdateRequestResponse<UserEntityDTO>() { IsOk = true, Message = "Success", Value = _mapper.Map<UserEntityDTO>(userFromDB), JWT = userFromDB.Token };
        }

        public async Task<UpdateRequestResponse<UserEntityDTO>> UpdatePhoneNumberAsync(string phoneNumber, int userId)
        {
            UserEntity userFromDB = await _unitOfWork.UserRepository.GetById(userId);
            userFromDB.UserDetails.Phone = phoneNumber;
            await _unitOfWork.UserRepository.UpdateAsync(userFromDB);
            await _unitOfWork.CompleteAsync();

            await _hubContext.Clients.All.SendAsync("PlayerUpdated", userFromDB);

            return new UpdateRequestResponse<UserEntityDTO>() { IsOk = true, Message = "Success", Value = _mapper.Map<UserEntityDTO>(userFromDB), JWT = userFromDB.Token };
        }

        public async Task<PaginatedResponse<UserEntityDTO>> GetUsersPaginatedAsync(int currentPage, int pageSize, UserFilter usersFilter = null)
        {
            var response = await _unitOfWork.UserRepository.GetUsersPaginatedAsync(currentPage, pageSize, usersFilter);

            var pResponse = new PaginatedResponse<UserEntityDTO>()
            {
                Items = _mapper.Map<List<UserEntityDTO>>(response.Items), 
                TotalPages = response.TotalPages,
                CurrentPage = response.CurrentPage
            };

            return pResponse;
        }

        public async Task<PaginatedResponse<UserEntityDTO>> GetUsersBySubstring(int currentPage, int pageSize, string str)
        {
            PaginatedResponse<UserEntity> response = await _unitOfWork.UserRepository.GetUsersBySubstringPaginated(currentPage, pageSize, str);
            var pResponse = new PaginatedResponse<UserEntityDTO>()
            {
                Items = _mapper.Map<List<UserEntityDTO>>(response.Items),
                TotalPages = response.TotalPages,
                CurrentPage = response.CurrentPage
            };

            return pResponse;
        }

        public async Task<ICollection<UserEntityDTO>> GetByMatch(int matchId)
        {
            ICollection<UserMatch> umList = await _unitOfWork.UserMatchRepository.GetCurrentPlayers(matchId);
            ICollection<UserEntityDTO> result = umList.Select(um => _mapper.Map<UserEntityDTO>(um.Player)).ToList();

            return result;
        }

    }
}
