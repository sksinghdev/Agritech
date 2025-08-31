// import 'package:dartz/dartz.dart';
// import '../../../../core/error/failures.dart';
// import '../../../../core/utils/result.dart';
// import '../../domain/entities/crop.dart';
// import '../../domain/repositories/crops_repository.dart';
// import '../models/crop_model.dart';
// import '../sources/crops_api_source.dart';
// import '../sources/crops_local_source.dart';

// class CropsRepositoryImpl implements CropsRepository {
//   final CropsApiSource api;
//   final CropsLocalSource local;
//   CropsRepositoryImpl(this.api, this.local);

//   @override
//   Future<Result<List<Crop>>> getCrops() async {
//     try {
//       // Try cache first (TTL 15 minutes)
//       final cached = await local.read(ttl: const Duration(minutes: 15));
//       if (cached != null) {
//         final items = CropModel.listFromJson(cached);
//         return Right(items);
//       }
//       // Fetch API
//       final json = await api.fetch();
//       await local.cache(json);
//       final items = CropModel.listFromJson(json);
//       return Right(items);
//     } catch (e) {
//       return Left(NetworkFailure(e.toString()));
//     }
//   }
// }

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/crop.dart';
import '../../domain/repositories/crops_repository.dart';
import '../models/crop_model.dart';
import '../sources/crops_api_source.dart';
import '../sources/crops_local_source.dart';

class CropsRepositoryImpl implements CropsRepository {
  final CropsApiSource api;
  final CropsLocalSource local;
  CropsRepositoryImpl(this.api, this.local);

  @override
  Future<Result<List<Crop>>> getCrops({bool refresh = false}) async {
    try { 
      if (!refresh) {
        final cached = await local.read(ttl: const Duration(minutes: 15));
        if (cached != null) {
          final items = CropModel.listFromJson(cached);
          return Right(items);
        }
      } 
      final json = await api.fetch();
      await local.cache(json);
      final items = CropModel.listFromJson(json);
      return Right(items);
    } catch (e) {
      return Left(NetworkFailure(e.toString()));
    }
  }
}
