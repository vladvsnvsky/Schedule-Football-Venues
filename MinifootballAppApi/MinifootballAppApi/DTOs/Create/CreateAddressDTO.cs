namespace MinifootballAppApi.DTOs.Create
{
    public class CreateAddressDTO
    {
        public int CityId { get; set; }
        public string StreetAndNo { get; set; }
        public double? Latitude { get; set; }
        public double? Longitude { get; set; }
    }
}
