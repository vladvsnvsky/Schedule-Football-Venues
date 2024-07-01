namespace MinifootballAppApi.DTOs.Create
{
    public class CreateUserEntityDTO
    {
        public string? Username { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public CreateAddressDTO Address { get; set; }
        public CreateUserDetailsDTO UserDetails { get; set; }
    }
}
