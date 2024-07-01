
namespace MinifootballAppApi.DTOs
{
    public class GameDetailsDTO
    {
        public int Id { get; set; }
        public string? OrganizerName { get; set; }
        public int OrganizerId { get; set; }
        public int FieldId { get; set; }
        public string? FieldName { get; set; }
        public int CityId { get; set; }
        public string? CityName { get; set; }
        public int CountryId { get; set; }
        public string? CountryName { get; set; }
        public int NrOfPlayersRequired { get; set; }
        public int CurrentNumberOfPlayers { get; set; }
        public string? GameTypeName { get; set; } //ex 5 a side
        public int MatchDurationInMinutes { get; set; }
        public bool Finished { get; set; }
        public bool IsCancelled { get; set; }
        public string? CancellationReason { get; set; }
        public int? PricePerPlayerUnits { get; set; }
        public int Day { get; set; }
        public int Month { get; set; }
        public int Year { get; set; }
        public int StartHour { get; set; }
        public int EndHour { get; set; }
    }
}
