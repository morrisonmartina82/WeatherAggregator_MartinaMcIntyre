# WeatherAggregator_MartinaMcIntyre
Multi layer app using C# .Net Core and EF
SQL db created locally using SQL Express - see sql script on root for create script
models loaded into solution using DB first scaffolding 
Business layer implements two reader types which accept a string of content, transform and persist
Factory pattern is implemented to allow for extension of other formats at a later date



Would have liked to:
use weather api calls to get data vs local file
Remove explicit use of SQL statements- i ran into issues storing records and to make sure i completed storing some daya before time ran out i resorted to using SQL queries
Complete test framework and get tests passing
Use of threading/parallel execution
allow update of weather data- if rows are received from same source and weather info has changed
