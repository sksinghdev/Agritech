import '../../../../core/utils/result.dart';
import '../entities/irrigation.dart';

abstract class IrrigationRepository {
  Future<Result<List<FieldSchedule>>> getSchedules();
}
