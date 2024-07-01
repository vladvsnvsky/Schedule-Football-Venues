namespace MinifootballAppApi.Exceptions
{
    public class EntityNotFoundException : BaseException
    {
        public EntityNotFoundException(string message)
        : base(message, 404) // 404 is just an example error code
        {
        }
    }
}
