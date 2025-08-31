import '../../domain/entities/weather.dart';

class WeatherModel {
  final String location;
  final List<ForecastModel> forecast;
  WeatherModel({required this.location, required this.forecast});

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        location: json['location'] as String,
        forecast: (json['forecast'] as List)
            .map((e) => ForecastModel.fromJson(e))
            .toList(),
      );

  Weather toEntity() => Weather(
      location: location, forecast: forecast.map((e) => e.toEntity()).toList());
}

class ForecastModel {
  final String day;
  final String temperature;
  final String condition;
  ForecastModel(
      {required this.day, required this.temperature, required this.condition});
  factory ForecastModel.fromJson(Map<String, dynamic> json) => ForecastModel(
      day: json['day'],
      temperature: json['temperature'],
      condition: json['condition']);
  Forecast toEntity() =>
      Forecast(day: day, temperature: temperature, condition: condition);
}
