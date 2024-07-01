namespace MinifootballAppApi.DTOs.Filters
{
    public class UserFilter
    {
        public int? Id { get; set; }
        public int? CountryId { get; set; }
        public int? CityId { get; set; }
        public bool? IsBanned { get; set; }
        public string? Name { get; set; }
        public string? Email { get; set; }
        public int? DayOfBirth { get; set; }
        public int? MonthOfBirth { get; set; }
        public int? YearOfBirth { get; set; }
        public bool? IsAdmin { get; set; }
        public bool? OrderByAgeAsc { get; set; }
        public bool? OrderByCreationDateAsc { get; set; }

    }
}
