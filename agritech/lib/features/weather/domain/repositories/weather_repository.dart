import '../../../../core/utils/result.dart';
import '../entities/weather.dart';

abstract class WeatherRepository {
  Future<Result<Weather>> getWeather();
}
