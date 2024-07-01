namespace MinifootballAppApi.DTOs
{
    public class CountryDTO
    {
        public int Id { get; set; }

        private string _name;
        public string Name
        {
            get => _name;
            set => _name = value?.ToUpper(); // Converts the assigned value to uppercase
        }
    }
}
