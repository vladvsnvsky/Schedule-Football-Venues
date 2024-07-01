using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MinifootballAppApi.Models
{
    public class UserEntity
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string? Username { get; set; }
        public string? Token { get; set; }
        public string? Email { get; set; }
        public string? Password { get; set; }
        public int BudgetUnits { get; set; } = 10000;
        public int AddressId { get; set; }
        public virtual Address Address { get; set; }
        public int UserDetailsId { get; set; }
        public bool IsBanned { get; set; } = false;
        public virtual UserDetails UserDetails { get; set; }
        public virtual List<UserRole> UserRoles { get; set; }
        public virtual DateTime? CreatedAt { get; set; }
        public virtual ICollection<Match>? OrganizedMatches { get; set; }
        public virtual ICollection<UserMatch> InvolvedMatches { get; set; }
        public virtual ICollection<UserEntity> Friends { get; set; }

        public UserEntity()
        {
            Friends = new HashSet<UserEntity>();
        }
    }

}
