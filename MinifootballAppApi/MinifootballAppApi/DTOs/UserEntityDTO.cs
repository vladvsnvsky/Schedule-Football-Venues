namespace MinifootballAppApi.DTOs
{
    public class UserEntityDTO
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string Token { get; set; }
        public int AddressId { get; set; }
        public int UserDetailsId { get; set; }
        public bool IsBanned { get; set; }
        public DateTime? CreatedAt { get; set; }
        public int BudgetUnits { get; set; } = 10000;

    }
}
