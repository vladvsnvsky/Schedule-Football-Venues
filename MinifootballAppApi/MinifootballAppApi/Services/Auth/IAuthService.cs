using MinifootballAppApi.Models;

namespace MinifootballAppApi.Services.Auth
{
    public interface IAuthService
    {
        public string GenerateToken(UserEntity user);
    }
}
