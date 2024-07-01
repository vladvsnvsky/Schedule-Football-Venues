using MinifootballAppApi.Models;

namespace MinifootballAppApi.Data.Enums
{
    public enum RoleEnum
    {
        ADMIN,
        PLAYER,
        FIELD_MANAGER
    }

    public static class RoleEnumExtensions
    {
        public static Role ToRole(this RoleEnum RoleEnum)
        {
            switch (RoleEnum)
            {
                case RoleEnum.ADMIN:
                    return new Role(1, RoleEnum.ADMIN);
                case RoleEnum.PLAYER:
                    return new Role(2, RoleEnum.PLAYER);
                case RoleEnum.FIELD_MANAGER:
                    return new Role(3, RoleEnum.FIELD_MANAGER);
                default:
                    throw new ArgumentException("Invalid Role enum");
            }
        }
    }
}
