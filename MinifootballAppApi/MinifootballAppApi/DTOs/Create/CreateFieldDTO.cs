namespace MinifootballAppApi.DTOs.Create
{
    public class CreateFieldDTO
    {
        public string? Name { get; set; }
        public string? Description { get; set; }
        public int? Capacity { get; set; }
        public float Width { get; set; }
        public float Length { get; set; }
        public int? PricePerHourUnits { get; set; }
        public string Phone { get; set; }
        public string? Email { get; set; }
        public int CityId { get; set; }
        public string StreetAndNo { get; set; }
        public float? GoogleMapsLatitude { get; set; }
        public float? GoogleMapsLongitude { get; set; }

    }
}
