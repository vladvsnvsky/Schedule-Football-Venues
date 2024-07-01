namespace MinifootballAppApi.DTOs.Update
{
    public class UpdateAddressDTO
    {
       public int CityId { get; set; }
       public string StreetAndNo { get; set; }
       public double? Latitude { get; set; }
       public double? Longitude { get; set; }

    }
}
