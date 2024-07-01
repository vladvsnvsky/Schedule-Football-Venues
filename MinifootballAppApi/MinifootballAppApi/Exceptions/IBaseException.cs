namespace MinifootballAppApi.Exceptions
{
    public interface IBaseException
    {
        string UserFriendlyMessage { get; }
        int ErrorCode { get; }
    }
}
