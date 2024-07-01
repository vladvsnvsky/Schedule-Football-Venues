using System.ComponentModel.DataAnnotations.Schema;

namespace MinifootballAppApi.DTOs
{
    public class UserDetailsDTO
    {
        public int Id { get; set; }
        public string Phone { get; set; }
        public DateOnly Birthdate { get; set; }
    }
}
