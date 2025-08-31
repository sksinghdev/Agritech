import '../../../../core/utils/result.dart';
import '../entities/weather.dart';
import '../repositories/weather_repository.dart';

class GetWeatherUseCase {
  final WeatherRepository repo;
  GetWeatherUseCase(this.repo);
  Future<Result<Weather>> call() => repo.getWeather();
}
