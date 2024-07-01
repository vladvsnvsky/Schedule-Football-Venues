using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using MinifootballAppApi.Models;

namespace MinifootballAppApi.Data
{
    public class MinifootballDbContext : DbContext
    {
        public DbSet<UserEntity> UserEntitiesTable { get; set; }
        public DbSet<UserDetails> UserDetailsTable { get; set; }
        public DbSet<Address> AddressTable { get; set; }
        public DbSet<Field> FieldsTable { get; set; }
        public DbSet<City> CitiesTable { get; set; }
        public DbSet<Country> CountriesTable { get; set; }
        public DbSet<Role> RolesTable { get; set; }
        public DbSet<Match> MatchTable { get; set; }
        public DbSet<UserMatch> PlayerMatchTable { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                IConfigurationRoot configuration = new ConfigurationBuilder()
                   .SetBasePath(Directory.GetCurrentDirectory())
                   .AddJsonFile("appsettings.json")
                   .Build();
                var connectionString = configuration.GetConnectionString("MinifootballApiDatabase");
                optionsBuilder.UseNpgsql(connectionString);
                
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

           

        }

        #region Constructors
        public MinifootballDbContext()
        {
        }

        public MinifootballDbContext(DbContextOptions options) : base(options)
        {

        }
        #endregion
    }
}
