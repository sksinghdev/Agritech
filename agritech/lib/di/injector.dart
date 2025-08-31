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

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt.registerLazySingleton(
      () => Dio(BaseOptions(baseUrl: 'http://localhost:4545')));
  getIt.registerLazySingleton(() => ApiService(getIt<Dio>()));
  getIt.registerLazySingleton(() => HiveManager());
  getIt.registerLazySingleton(() => AppRouter());

  // Crop
  getIt.registerLazySingleton<CropsApiSource>(
      () => CropsApiSource(getIt<ApiService>()));
  getIt.registerLazySingleton<CropsLocalSource>(
      () => CropsLocalSource(getIt<HiveManager>()));
  getIt.registerLazySingleton<CropsRepository>(
    () =>
        CropsRepositoryImpl(getIt<CropsApiSource>(), getIt<CropsLocalSource>()),
  );
}
