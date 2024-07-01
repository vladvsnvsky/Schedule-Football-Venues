namespace MinifootballAppApi.DTOs.Update
{
    public class UpdateMatchDTO
    {
        public int FieldId { get; set; }
        public int OrganizerId { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        public int NrOfPlayersRequired { get; set; }
        public bool PlayerCanJoin { get; set; }
        public bool Finished { get; set; }
        public bool Cancelled { get; set; } = false;
        public string? CancelledReason { get; set; }
    }
}
