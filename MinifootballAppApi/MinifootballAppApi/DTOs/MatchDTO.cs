using MinifootballAppApi.Models;

namespace MinifootballAppApi.DTOs
{
    public class MatchDTO
    {
        public int Id { get; set; }
        public int FieldId { get; set; }
        public int OrganizerId { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        public int NrOfPlayersRequired { get; set; } = 12;
        public int PricePerPlayerUnits { get; set; }
        public bool PlayerCanJoin { get; set; } = true;
        public bool Finished { get; set; } = false;
        public bool Cancelled { get; set; } = false;
        public string? CancelledReason { get; set; }
        public int GoalsTeam1 { get; set; } = 0;
        public int GoalsTeam2 { get; set; } = 0;
    }
}
