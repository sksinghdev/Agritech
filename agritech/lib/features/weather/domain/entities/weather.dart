import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String location;
  final List<Forecast> forecast;
  const Weather({required this.location, required this.forecast});
  @override
  List<Object?> get props => [location, forecast];
}

class Forecast extends Equatable {
  final String day;
  final String temperature;
  final String condition;
  const Forecast(
      {required this.day, required this.temperature, required this.condition});
  @override
  List<Object?> get props => [day, temperature, condition];
}
