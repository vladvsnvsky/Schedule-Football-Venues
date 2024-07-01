namespace MinifootballAppApi.DTOs.Update
{
    public class UpdateUserEntityDTO
    {
        public string? Username { get; set; }
        public UpdateAddressDTO? Address { get; set; }
        public UpdateUserDetailsDTO? UserDetails { get; set; }
    }
}
