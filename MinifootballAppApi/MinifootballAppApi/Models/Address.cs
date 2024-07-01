using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MinifootballAppApi.Models
{
    public class Address
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public int CityId { get; set; }
        public virtual City City { get; set; }
        public string StreetAndNo { get; set; }
        public double? Latitude { get; set; }
        public double? Longitude { get; set;}
    }
}

