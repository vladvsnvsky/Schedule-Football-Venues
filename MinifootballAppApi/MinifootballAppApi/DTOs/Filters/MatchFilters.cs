namespace MinifootballAppApi.DTOs.Filters
{
    public class MatchFilters
    {
        public int? OrganizerId { get; set; }
        public int? FieldId { get; set; }
        public int? CountryId { get; set; }
        public int? CityId { get; set; }
        public DateTime? StartDateFrom { get; set; }
        public DateTime? StartDateTo { get; set; }
        public DateTime? EndDateFrom { get; set; }
        public DateTime? EndDateTo { get; set; }
        public int? MinPlayersRequired { get; set; }
        public int? MaxPlayersRequired { get; set; }
        public bool? PlayerCanJoin { get; set; }
        public bool? Finished { get; set; }
        public bool? Cancelled { get; set; }
        public int? MinSpotsAvailable { get; set; }
        public int? MaxSpotsAvailable { get; set; }
    }

}
