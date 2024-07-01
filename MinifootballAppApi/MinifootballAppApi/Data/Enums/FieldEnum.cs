using MinifootballAppApi.Models;

namespace MinifootballAppApi.Data.Enums
{
    public enum FieldEnum
    {
        Field1,
        Field2,
        Field3
    }

    public static class FieldEnumExtensions
    {
        public static Field ToField(this FieldEnum fieldEnum, MinifootballDbContext context)
        {

            switch (fieldEnum)
            {
                case FieldEnum.Field1:
                    {
                        var city = context.CitiesTable.FirstOrDefault(c => c.Name.Equals(CitiesEnum.Madrid.ToString()));
                        if (city is null)
                        {
                            throw new Exception($"City error: {CitiesEnum.Madrid}");
                        }
                        return new Field
                        {
                            Id = 1,
                            Name = "Field Madrid",
                            Description = "Description of Field Madrid Updated",
                            Capacity = 100,
                            Width = 50.0,
                            Length = 70.0,
                            Phone = "1234567890",
                            Email = "fieldMadrid@example.com",
                            IsActive = true,
                            Address = new Address
                            {
                                StreetAndNo = "InitialDefault Madrid 1",
                                CityId = city.Id,
                                Latitude = 40.396315,
                                Longitude = -3.692520
                            }
                        };
                    };

                case FieldEnum.Field2:
                    {
                        var city = context.CitiesTable.FirstOrDefault(c => c.Name.Equals(CitiesEnum.Brasov.ToString()));
                        if (city is null)
                        {
                            throw new Exception($"City error: {CitiesEnum.Brasov}");
                        }
                        return new Field
                        {
                            Id = 2,
                            Name = "Field Brasov",
                            Description = "Description of Field Brasov",
                            Capacity = 80,
                            Width = 60.0,
                            Length = 80.0,
                            Phone = "0987654321",
                            Email = "fieldBrasov@example.com",
                            IsActive = true,
                            Address = new Address
                            {
                                StreetAndNo = "InitialDefault Brasov 1",
                                CityId = city.Id,
                                Latitude = 5.636840,
                                Longitude = 25.613036
                            }
                        };
                    };

                case FieldEnum.Field3:
                    {
                        var city = context.CitiesTable.FirstOrDefault(c => c.Name.Equals(CitiesEnum.Manchester.ToString()));
                        if (city is null)
                        {
                            throw new Exception($"City error: {CitiesEnum.Manchester}");
                        }
                        return new Field
                        {
                            Id = 3,
                            Name = "Field Manchester",
                            Description = "Description of Field Manchester",
                            Capacity = 120,
                            Width = 55.0,
                            Length = 75.0,
                            Phone = "111222333",
                            Email = "fieldManchester@example.com",
                            IsActive = true,
                            Address = new Address
                            {
                                StreetAndNo = "InitialDefault Manchester 1",
                                CityId = city.Id,
                                Latitude = 53.463,
                                Longitude = -2.2123,
                            }
                        };
                    };

                default:
                    throw new ArgumentException("Invalid field enum");
            }
        }
    }

}
