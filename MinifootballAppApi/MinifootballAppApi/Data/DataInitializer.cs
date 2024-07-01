using Microsoft.AspNetCore.Components.Forms;
using MinifootballAppApi.Data;
using MinifootballAppApi.Data.Enums;
using MinifootballAppApi.DTOs;
using MinifootballAppApi.Models;
using MinifootballAppApi.Repository.Interface;
using MinifootballAppApi.Services.Auth;




public class DataInitializer
{
    private readonly MinifootballDbContext _context;
    private readonly IAuthService _authService;
    public DataInitializer(MinifootballDbContext context, IAuthService authService)
    {
        _context = context;
        _authService = authService;
    }

    public void Initialize()
    {
        _context.Database.EnsureCreated();

        // Add countries
        foreach (CountriesEnum countryEnum in Enum.GetValues(typeof(CountriesEnum)))
        {
            string countryName = countryEnum.ToString();

            var countryDB = _context.CountriesTable.FirstOrDefault(c => c.Name.Equals(countryName));
            // Check if the country exists in the database
            if (countryDB is null)
            {
                countryDB = new Country
                {
                    Name = countryName
                };
                _context.CountriesTable.Add(countryDB);
            }

        }

        _context.SaveChanges();

        //Add cities
        foreach (CitiesEnum cityEnum in Enum.GetValues(typeof(CitiesEnum)))
        {
            string countryName = cityEnum.GetCountry().ToString();
            var cityName = cityEnum.ToString();
            var utcOffset = cityEnum.GetUtcOffset();
            var countryDB = _context.CountriesTable.FirstOrDefault(c => c.Name.Equals(countryName));

            if (countryDB is not null)
            {
                var cityDB = _context.CitiesTable.FirstOrDefault(c => c.Name.Equals(cityName));
                if (cityDB is null)
                {
                    cityDB = new City
                    {
                        Name = cityName,
                        Country = countryDB,
                        UtcOffset = utcOffset
                    };
                    _context.CitiesTable.Add(cityDB);
                }
                else
                {
                    cityDB.Name = cityName;
                    cityDB.Country = countryDB;
                    cityDB.UtcOffset = utcOffset;
                    _context.CitiesTable.Update(cityDB);
                }
            }
            else
            {
                System.Console.Error.WriteLine($"Country {countryName} doesn't exists in Database and city {cityName} cannot be added!");
            }
        }

        _context.SaveChanges();

        //Add fields
        foreach (FieldEnum fieldEnum in Enum.GetValues(typeof(FieldEnum)))
        {
            var field = fieldEnum.ToField(_context);
            var fieldId = field.Id;
            var fieldDB = _context.FieldsTable.FirstOrDefault(f => f.Id == fieldId);
            if (fieldDB is null)
            {
                fieldDB = field;
                _context.FieldsTable.Add(fieldDB);
            }
            else
            {
                fieldDB.Name = field.Name;
                fieldDB.Description = field.Description;
                fieldDB.Capacity = field.Capacity;
                fieldDB.Width = field.Width;
                fieldDB.Length = field.Length;
                fieldDB.Phone = field.Phone;
                fieldDB.Email = field.Email;
                fieldDB.IsActive = field.IsActive;
                _context.FieldsTable.Update(fieldDB);
            }
        }

        _context.SaveChanges();

        //Add UserRoles
        foreach (RoleEnum roleEnum in Enum.GetValues(typeof(RoleEnum)))
        {
            var role = roleEnum.ToRole();
            var roleId = role.Id;
            var roleDB = _context.RolesTable.FirstOrDefault(f => f.Id == roleId);
            if (roleDB is null)
            {
                roleDB = role;
                _context.RolesTable.Add(roleDB);
            }
            else
            {
                roleDB.Name = role.Name;
            }
        }
        _context.SaveChanges();

        var initialAdmin = _context.UserEntitiesTable.FirstOrDefault(u => u.Username == "admin");

        if (initialAdmin is null)
        {
            //Add admin
            UserEntity userEntity = new UserEntity()
            {
                Id = 1,
                Username = "admin",
                Email = "admin@testmail.dev",
                Password = PasswordHasher.HashPassword("admin01#"),
                Token = "",
                Address = new Address()
                {
                    CityId = 1,
                    StreetAndNo = "Strada Adminului 15"
                },
                UserDetails = new UserDetails()
                {
                    Phone = "0773994658",
                    Birthdate = DateOnly.MinValue
                }
            };

            _context.UserEntitiesTable.Add(userEntity);
            _context.SaveChanges();

            //Set roles for the admin
            var userFromDb = _context.UserEntitiesTable.FirstOrDefault(u => u.Username == "admin");
            if (userFromDb is null)
            {
                throw new Exception("Admin doesn't exist!");
            }
            else
            {
                userFromDb.UserRoles = new List<UserRole>();
                userFromDb.UserRoles.Add(new UserRole() { RoleId = 1, UserId = userFromDb.Id });
                userFromDb.UserRoles.Add(new UserRole() { RoleId = 2, UserId = userFromDb.Id });

                userFromDb.Token = _authService.GenerateToken(userFromDb);

                _context.UserEntitiesTable.Update(userFromDb);
                _context.SaveChanges();
            }
        }
    }
}

