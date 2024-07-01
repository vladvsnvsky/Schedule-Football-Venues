using MinifootballAppApi.Models;
using System.ComponentModel.DataAnnotations.Schema;

namespace MinifootballAppApi.DTOs
{
    public class AddressDTO
    {
        public int Id { get; set; }
        public int CityId { get; set; }
        public string? CityName { get; set; }
        public int CountryId { get; set; }
        public string? CountryName { get; set; }
        public string StreetAndNo { get; set; }
        public double ? Latitude { get; set; }
        public double? Longitude { get; set; }
    }
}
