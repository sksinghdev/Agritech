import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/irrigation.dart';
import '../../domain/repositories/irrigation_repository.dart';
import '../models/irrigation_model.dart';
import '../sources/irrigation_api_source.dart';
import '../sources/irrigation_local_source.dart';

class IrrigationRepositoryImpl implements IrrigationRepository {
  final IrrigationApiSource api;
  final IrrigationLocalSource local;
  IrrigationRepositoryImpl(this.api, this.local);
  @override
  Future<Result<List<FieldSchedule>>> getSchedules() async {
    try {
      final cached = await local.read(ttl: const Duration(minutes: 30));
      if (cached != null) return Right(FieldScheduleModel.listFromJson(cached));
      final json = await api.fetch();
      await local.cache(json);
      return Right(FieldScheduleModel.listFromJson(json));
    } catch (e) {
      return Left(NetworkFailure(e.toString()));
    }
  }
}
