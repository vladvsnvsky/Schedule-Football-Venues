namespace MinifootballAppApi.DTOs.Update
{
    public class UpdateFieldDTO
    {
        public string? Name { get; set; }
        public string? Description { get; set; }
        public int? Capacity { get; set; }
        public double Width { get; set; }
        public double Length { get; set; }
        public double? PricePerHourUnits { get; set; }
        public string Phone { get; set; }
        public string? Email { get; set; }
    }
}
