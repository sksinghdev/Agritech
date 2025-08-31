import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';
import '../models/weather_model.dart';
import '../sources/weather_api_source.dart';
import '../sources/weather_local_source.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiSource api;
  final WeatherLocalSource local;
  WeatherRepositoryImpl(this.api, this.local);
  @override
  Future<Result<Weather>> getWeather() async {
    try {
      final cached = await local.read(ttl: const Duration(minutes: 10));
      if (cached != null)
        return Right(WeatherModel.fromJson(cached).toEntity());
      final json = await api.fetch();
      await local.cache(json);
      return Right(WeatherModel.fromJson(json).toEntity());
    } catch (e) {
      return Left(NetworkFailure(e.toString()));
    }
  }
}
