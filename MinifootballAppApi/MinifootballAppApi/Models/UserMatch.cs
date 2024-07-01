
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MinifootballAppApi.Models
{
    public class UserMatch
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public int PlayerId { get; set; }
        public virtual UserEntity Player { get; set; } = null!;
        public int MatchId { get; set; }
        public virtual Match Match { get; set; } = null!;
        public int? MinutesPlayed { get; set; }
        public int? GoalsScored { get; set; }
        public int? FoulsCommited { get; set; }
        public bool IsMVP { get; set; } = false;
    }
}
