import '../../../../core/utils/result.dart';
import '../entities/irrigation.dart';
import '../repositories/irrigation_repository.dart';

class GetIrrigationUseCase {
  final IrrigationRepository repo;
  GetIrrigationUseCase(this.repo);
  Future<Result<List<FieldSchedule>>> call() => repo.getSchedules();
}
