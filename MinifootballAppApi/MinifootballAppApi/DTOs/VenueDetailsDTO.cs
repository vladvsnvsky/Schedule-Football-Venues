namespace MinifootballAppApi.DTOs
{
    public class VenueDetailsDTO
    {
        public int VenueId { get; set; }
        public int CityId { get; set; }
        public int CountryId { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Description { get; set; }
        public string StreetAndNo { get; set; }
        public string? CityName { get; set; }
        public string? CountryName { get; set; }
        public int? Width { get; set; }
        public int? Length { get; set; }
        public int? Capacity { get; set; }
        public double? Latitude { get; set; }
        public double? Longitude { get; set; }
        public int PricePerHourUnits { get; set; }
        public bool? IsActive { get; set; }

    }
}
