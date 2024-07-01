using MinifootballAppApi.Models;

namespace MinifootballAppApi.DTOs
{
    public class FieldDTO
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public string? Description { get; set; }
        public int? Capacity { get; set; }
        public double Width { get; set; }
        public double Length { get; set; }
        public string Phone { get; set; }
        public string? Email { get; set; }
        public int AddressId { get; set; }
        public int? PricePerHourUnits { get; set; }
        public bool IsActive { get; set; } = true;
    }
}
