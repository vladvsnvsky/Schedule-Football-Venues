using System.Xml.Linq;

namespace MinifootballAppApi.DTOs.Create
{
    public class CreateCountryDTO
    {
        private string _name;
        public string Name
        {
            get => _name;
            set => _name = value?.ToUpper(); // Converts the assigned value to uppercase
        }
    }
}
