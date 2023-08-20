using WeatherAggregatorBLL.Interfaces;

namespace WeatherAggregator_MartinaMcIntyre
{
    public class App
    {
        private readonly IDataReaderFactory _drf;

        public App(IDataReaderFactory drf)
        {
            _drf = drf;
        }

        public void Run(string[] args)
        {
            string fileName = "weatherData.json";
            string jsonString = File.ReadAllText(fileName);

            string xmlfileName = "weatherData.xml";
            string xmlString = File.ReadAllText(xmlfileName);

            if (!String.IsNullOrEmpty(jsonString))
            {
                IWeatherPersistence fac = _drf.Create("jsonData");
                bool message = fac.persistWeatherData(jsonString, "Google Weather", "JSON File");
            }

            if (!String.IsNullOrEmpty(xmlString))
            {
                IWeatherPersistence second = _drf.Create("xmlData");
                bool message = second.persistWeatherData(xmlString, "MSN Weather", "XML File");
            }
        }
    }
}
