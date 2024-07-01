using Microsoft.IdentityModel.Tokens;
using MinifootballAppApi.Data.Enums;
using MinifootballAppApi.Models;
using MinifootballAppApi.Repository.Interface;
using System.Data;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;

namespace MinifootballAppApi.Services.Auth
{
    public class AuthService : IAuthService
    {
        private readonly IConfiguration _config;
        private readonly IUnitOfWork _unitOfWork;
        public AuthService(IConfiguration config, IUnitOfWork unitOfWork)
        {
            _config = config;
            _unitOfWork = unitOfWork;
        }
        public string GenerateToken(UserEntity user)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);
            var claims = new List<Claim>()
            {
                new Claim(ClaimTypes.NameIdentifier,user.Username),
                new Claim(ClaimTypes.Sid,user.Id.ToString()),
                new Claim(ClaimTypes.Email,user.Email)
            };

            
            foreach(var role in user.UserRoles)
            {
                var roleName = "";
                switch (role.RoleId)
                {
                    case 1: roleName = RoleEnum.ADMIN.ToString(); break;
                    case 2: roleName = RoleEnum.PLAYER.ToString(); break;
                    case 3: roleName = RoleEnum.FIELD_MANAGER.ToString(); break;
                }
                claims.Add(new Claim(ClaimTypes.Role, roleName));
            }

            var token = new JwtSecurityToken(_config["Jwt:Issuer"],
                _config["Jwt:Audience"],
                claims,
                //expires: DateTime.Now.AddHours(2),
                signingCredentials: credentials);


            return new JwtSecurityTokenHandler().WriteToken(token);

        }

        public static string GenerateSecureKey()
        {
            using (var rng = new RNGCryptoServiceProvider())
            {
                var keyBytes = new byte[32]; // 256 bits
                rng.GetBytes(keyBytes);
                return Convert.ToBase64String(keyBytes); // Convert key to Base64 for easy storage and handling
            }
        }
    }
}
