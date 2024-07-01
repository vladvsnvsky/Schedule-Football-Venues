namespace MinifootballAppApi.Repository.Interface
{
    public interface IUnitOfWork : IDisposable, IAsyncDisposable
    {
        IUserRepository UserRepository { get; }
        IFieldRepository FieldRepository { get; }
        IMatchRepository MatchRepository { get; }
        ICityRepository CityRepository { get; }
        ICountryRepository CountryRepository { get; }
        IAddressRepository AddressRepository { get; }
        IRoleRepository RoleRepository { get; }
        IUserMatchRepository UserMatchRepository { get; }

        Task CompleteAsync();
    }
}
