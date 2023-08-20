using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using WeatherAggregator_MartinaMcIntyre;
using WeatherAggregatorBLL.Factories;
using WeatherAggregatorDAL;
using WeatherAggregatorDAL.DBModel;
using WeatherAggregatorDAL.Interface;

using IHost host = CreateHostBuilder(args).Build();
using var scope = host.Services.CreateScope();

var services = scope.ServiceProvider;

try
{
    services.GetRequiredService<App>().Run(args);
}
catch (Exception ex)
{
    Console.WriteLine(ex.Message);
}


static IHostBuilder CreateHostBuilder(string[] args)
{
    return Host.CreateDefaultBuilder(args)
        .ConfigureServices((hostContext, services) =>
        {
            IConfiguration configuration = hostContext.Configuration;
            services.AddSingleton<App>();
            services.AddSingleton<IPersistData, PersistData>();
            services.AddWeatherDataReader();
            services.AddDbContext<WeatherDbContext>(options => options.UseSqlServer(
                           configuration.GetConnectionString("WeatherConnection")));
        });
}
