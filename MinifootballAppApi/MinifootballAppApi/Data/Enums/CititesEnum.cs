public enum CitiesEnum
{
    Bucharest,
    Brasov,
    London,
    Manchester,
    Madrid,
    Barcelona,
    Valencia
}

public static class CitiesEnumExtensions
{
    public static CountriesEnum GetCountry(this CitiesEnum city)
    {
        switch (city)
        {
            case CitiesEnum.Bucharest:
            case CitiesEnum.Brasov:
                return CountriesEnum.ROMANIA;
            case CitiesEnum.London:
            case CitiesEnum.Manchester:
                return CountriesEnum.ENGLAND;
            case CitiesEnum.Madrid:
            case CitiesEnum.Valencia:
            case CitiesEnum.Barcelona:
                return CountriesEnum.SPAIN;
            default:
                throw new ArgumentException("Invalid city");
        }
    }

    public static int GetUtcOffset(this CitiesEnum city)
    {
        switch (city)
        {
            case CitiesEnum.Bucharest:
            case CitiesEnum.Brasov:
                return 2;
            case CitiesEnum.London:
            case CitiesEnum.Manchester:
                return 0;
            case CitiesEnum.Madrid:
            case CitiesEnum.Valencia:
            case CitiesEnum.Barcelona:
                return 0;
            default:
                throw new ArgumentException("Invalid city");
        }
    }
}