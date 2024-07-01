
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace MinifootballAppApi.Models
{
    public class Field
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string? Name { get; set; }
        public string? Description { get; set; }
        public int? Capacity { get; set; }
        public double Width { get; set; }
        public double Length { get; set; }
        public string Phone { get; set; }
        public string? Email { get; set; }
        public int AddressId { get; set; }
        public virtual Address Address { get; set; }
        public virtual ICollection<Match>? Matches { get; set; }
        public int? BudgetUnits { get; set; } = 0;
        public int? PricePerHourUnits { get; set; } = 0;
        public bool IsActive { get; set; } = true;
    }
}
