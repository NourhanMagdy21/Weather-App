class WeatherModel {
  final String cityName;
  final String date;
  final String image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  WeatherModel({required this.cityName,
    required this.date,
    required this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition});

  factory WeatherModel.fromJson(json){
    return WeatherModel(cityName:  json['location']['name'],
        date:json['current']['last_updated'],
        temp: json['forecast']['forecastday']['0']['day']['avgtemp_c'],
        maxTemp: json['forecast']['forecastday']['0']['day']['maxtemp_f'],
        minTemp:json['forecast']['forecastday']['0']['day']['mintemp_c'],
        weatherCondition: json['forecast']['forecastday']['0']['day']['condition']['text'],
      image: json['forecast']['forecastday']['0']['day']['condition']['text']['icon'],

    );

  }
}
