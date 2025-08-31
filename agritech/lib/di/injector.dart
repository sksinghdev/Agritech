import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../core/network/api_service.dart';
import '../core/storage/hive_manager.dart';
import '../routes/app_router.dart';
import '../features/crops/data/sources/crops_api_source.dart';
import '../features/crops/data/sources/crops_local_source.dart';
import '../features/crops/data/repositories/crops_repository_impl.dart';
import '../features/crops/domain/repositories/crops_repository.dart';
import '../features/crops/domain/usecases/get_crops_usecase.dart';
import '../features/crops/presentation/cubit/crops_cubit.dart';
import '../features/weather/data/sources/weather_api_source.dart';
import '../features/weather/data/sources/weather_local_source.dart';
import '../features/weather/data/repositories/weather_repository_impl.dart';
import '../features/weather/domain/repositories/weather_repository.dart';
import '../features/weather/domain/usecases/get_weather_usecase.dart';
import '../features/weather/presentation/cubit/weather_cubit.dart';
import '../features/irrigation/data/sources/irrigation_api_source.dart';
import '../features/irrigation/data/sources/irrigation_local_source.dart';
import '../features/irrigation/data/repositories/irrigation_repository_impl.dart';
import '../features/irrigation/domain/repositories/irrigation_repository.dart';
import '../features/irrigation/domain/usecases/get_irrigation_usecase.dart';
import '../features/irrigation/presentation/cubit/irrigation_cubit.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt.registerLazySingleton(
      () => Dio(BaseOptions(baseUrl: 'http://localhost:4545')));
  getIt.registerLazySingleton(() => ApiService(getIt<Dio>()));
  getIt.registerLazySingleton(() => HiveManager());
  getIt.registerLazySingleton(() => AppRouter());

  // Crops
  getIt.registerLazySingleton<CropsApiSource>(
      () => CropsApiSource(getIt<ApiService>()));
  getIt.registerLazySingleton<CropsLocalSource>(
      () => CropsLocalSource(getIt<HiveManager>()));
  getIt.registerLazySingleton<CropsRepository>(
    () =>
        CropsRepositoryImpl(getIt<CropsApiSource>(), getIt<CropsLocalSource>()),
  );
  getIt.registerFactory(() => GetCropsUseCase(getIt<CropsRepository>()));
  getIt.registerFactory(() => CropsCubit(getIt<GetCropsUseCase>()));

// Weather
  getIt.registerLazySingleton<WeatherApiSource>(
      () => WeatherApiSource(getIt<ApiService>()));
  getIt.registerLazySingleton<WeatherLocalSource>(
      () => WeatherLocalSource(getIt<HiveManager>()));
  getIt.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
        getIt<WeatherApiSource>(), getIt<WeatherLocalSource>()),
  );
  getIt.registerFactory(() => GetWeatherUseCase(getIt<WeatherRepository>()));
  getIt.registerFactory(() => WeatherCubit(getIt<GetWeatherUseCase>()));

// Irrigation
  getIt.registerLazySingleton<IrrigationApiSource>(
      () => IrrigationApiSource(getIt<ApiService>()));
  getIt.registerLazySingleton<IrrigationLocalSource>(
      () => IrrigationLocalSource(getIt<HiveManager>()));
  getIt.registerLazySingleton<IrrigationRepository>(
    () => IrrigationRepositoryImpl(
        getIt<IrrigationApiSource>(), getIt<IrrigationLocalSource>()),
  );
  getIt.registerFactory(
      () => GetIrrigationUseCase(getIt<IrrigationRepository>()));
  getIt.registerFactory(() => IrrigationCubit(getIt<GetIrrigationUseCase>()));
}
