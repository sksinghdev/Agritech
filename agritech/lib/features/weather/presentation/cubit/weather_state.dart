part of 'weather_cubit.dart';

enum WeatherStatus { initial, loading, success, error }

class WeatherState extends Equatable {
  final WeatherStatus status;
  final Weather? data;
  final String? error;
  const WeatherState({required this.status, this.data, this.error});
  factory WeatherState.initial() =>
      const WeatherState(status: WeatherStatus.initial);
  WeatherState copyWith(
          {WeatherStatus? status, Weather? data, String? error}) =>
      WeatherState(
          status: status ?? this.status,
          data: data ?? this.data,
          error: error ?? this.error);
  @override
  List<Object?> get props => [status, data, error];
}
