using MinifootballAppApi.Data;
using MinifootballAppApi.Repository.Interface;
using SQLitePCL;

namespace MinifootballAppApi.Repository
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly MinifootballDbContext _context;
        
        private IUserRepository _userRepository;
        public IUserRepository UserRepository => _userRepository??=new UserRepository(_context);
        
        private IFieldRepository _fieldRepository;
        public IFieldRepository FieldRepository => _fieldRepository ??= new FieldRepository(_context);

        private IMatchRepository _matchRepository;
        public IMatchRepository MatchRepository => _matchRepository ??= new MatchRepository(_context);

        private ICityRepository _cityRepository;
        public ICityRepository CityRepository => _cityRepository ??= new CityRepository(_context);

        private ICountryRepository _countryRepository;
        public ICountryRepository CountryRepository => _countryRepository ??= new CountryRepository(_context);

        private IAddressRepository _addressRepository;
        public IAddressRepository AddressRepository => _addressRepository ??= new AddressRepository(_context);

        private IRoleRepository _roleRepository;
        public IRoleRepository RoleRepository => _roleRepository ??= new RoleRepository(_context);
        public IUserMatchRepository UserMatchRepository => new UserMatchRepository(_context);
        


        public UnitOfWork(MinifootballDbContext context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public async Task CompleteAsync()
        {
            await _context.SaveChangesAsync();
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                _context.Dispose();
            }
        }

        public async ValueTask DisposeAsync()
        {
            await DisposeAsync(true);
            GC.SuppressFinalize(this);
        }

        private bool _disposed;
        protected virtual async ValueTask DisposeAsync(bool disposing)
        {
            if (!_disposed)
            {
                if (disposing)
                {
                    await _context.DisposeAsync();
                }

                _disposed = true;
            }
        }
    }
}
