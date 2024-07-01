namespace MinifootballAppApi.Exceptions
{
    public class EntityCannotBeCreatedException : BaseException
    {
        public EntityCannotBeCreatedException(string message)
        : base(message, 12)
        {
        }

        public EntityCannotBeCreatedException()
        : base("This entity probably exists or credentials are bad!", 12)
        {
        }
    }
}
