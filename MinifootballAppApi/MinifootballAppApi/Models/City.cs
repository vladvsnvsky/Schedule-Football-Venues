
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MinifootballAppApi.Models
{
    public class City
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string Name { get; set; }
        public int CountryId { get; set; }
        public int UtcOffset { get; set; }
        public virtual Country Country { get; set; }
        public virtual ICollection<Field> Fields { get; set; }
    }
}
