class WeatherModel {
  final double temp;
  final double temp_max;
  final double temp_min;
  final double feels_like;

  final double speed;
  final int humidity;
  final int pressure;
  final int visibility;

  final String description;
  WeatherModel({
    required this.temp,
    required this.temp_max,
    required this.temp_min,
    required this.feels_like,
    required this.speed,
    required this.humidity,
    required this.pressure,
    required this.visibility,
    required this.description,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> e) {
    return WeatherModel(
      temp: e['main']['temp'],
      temp_max: e['main']['temp_max'],
      temp_min: e['main']['temp_min'],
      feels_like: e['main']['feels_like'],
      speed: e['wind']['speed'],
      humidity: e['main']['humidity'],
      pressure: e['main']['pressure'],
      visibility: e['visibility'],
      description: e['weather'][0]['description'],
    );
  }
}
