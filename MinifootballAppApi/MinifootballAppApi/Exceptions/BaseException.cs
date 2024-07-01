namespace MinifootballAppApi.Exceptions
{
    public class BaseException : Exception, IBaseException
    {
        public int ErrorCode { get; private set; }
        public string UserFriendlyMessage { get; private set; }

        public BaseException(string userFriendlyMessage, int errorCode)
        : base(userFriendlyMessage)
        {
            UserFriendlyMessage = userFriendlyMessage;
            ErrorCode = errorCode;
        }

        public BaseException(string userFriendlyMessage, int errorCode, Exception innerException)
        : base(userFriendlyMessage, innerException)
        {
            UserFriendlyMessage = userFriendlyMessage;
            ErrorCode = errorCode;
        }
    }
}
