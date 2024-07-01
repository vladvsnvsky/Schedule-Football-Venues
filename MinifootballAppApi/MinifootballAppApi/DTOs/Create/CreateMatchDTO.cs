namespace MinifootballAppApi.DTOs.Create
{
    public class CreateMatchDTO
    {
        public int FieldId { get; set; }
        public int OrganizerId { get; set; }
        public int StartHour { get; set; }
        public int StartDay { get; set; }
        public int StartMonth { get; set; }
        public int StartYear { get; set; }
        public int EndHour { get; set; }
        public int EndDay { get; set; }
        public int EndMonth { get; set; }
        public int EndYear { get; set; }
        public int NrOfPlayersRequired { get; set; }
        public bool PlayerCanJoin { get; set; }
        public bool Cancelled { get; set; } = false;
        public string? CancelledReason { get; set; }
        public int PricePerPlayerUnits { get; set; }

    }
}
