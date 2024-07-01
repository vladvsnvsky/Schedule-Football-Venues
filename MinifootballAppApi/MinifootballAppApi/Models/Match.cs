

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace MinifootballAppApi.Models
{
    public class Match
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public int FieldId { get; set; }
        public virtual Field Field { get; set; }
        public int OrganizerId { get; set; }
        public virtual UserEntity Organizer { get; set; }

        private DateTime _startTime;
        private DateTime _endTime;
        public DateTime StartTime
        {
            get => DateTime.SpecifyKind(_startTime, DateTimeKind.Utc);
            set => _startTime = DateTime.SpecifyKind(value, DateTimeKind.Utc);
        }

        public DateTime EndTime
        {
            get => DateTime.SpecifyKind(_endTime, DateTimeKind.Utc);
            set => _endTime = DateTime.SpecifyKind(value, DateTimeKind.Utc);
        }
        public int NrOfPlayersRequired { get; set; }
        public bool PlayerCanJoin { get; set; } = true;
        public bool Finished { get; set; } = false;
        public bool Cancelled { get; set; } = false;
        public string? CancelledReason { get; set; }
        public virtual ICollection<UserMatch> Players { get; set; } = new List<UserMatch>();
        public int GoalsTeam1 { get; set; } = 0;
        public int GoalsTeam2 { get; set; } = 0;
        public int PricePerPlayerUnits { get; set; } = 0;
        public int CurrentNumberOfPlayers { get; set; } = 1;
        public int MatchBudgetUnits { get; set; } = 0;
    }
}
