using MinifootballAppApi.Models;

namespace MinifootballAppApi.DTOs
{
    public class UserMatchDTO
    {
        public int Id { get; set; }
        public int PlayerId { get; set; }
        public int MatchId { get; set; }
        public int? MinutesPlayed { get; set; }
        public int? GoalsScored { get; set; } = 0;
        public int? FoulsCommited { get; set; } = 0;
        public bool IsMVP { get; set; } = false;
    }
}
