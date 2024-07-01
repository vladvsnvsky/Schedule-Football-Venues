namespace MinifootballAppApi.Utils
{
    public class UpdateRequestResponse<T> where T : class
    {
        public T? Value { get; set; }
        public string? Message { get; set; }
        public bool IsOk { get; set; }
        public string? JWT { get; set; }
    }
}
