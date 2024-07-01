namespace MinifootballAppApi.Singletons
{
    public class ThemeSettings
    {
        static ThemeSettings? instance;
        public string ColorThemeName { get; set; } = "dark-def";

        protected ThemeSettings() { }
        public static ThemeSettings Instance()
        {
            if(instance == null)
                instance = new ThemeSettings();
            return instance;
        }

    }
}
