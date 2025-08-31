 import '../../../../core/utils/result.dart';
import '../entities/crop.dart';

abstract class CropsRepository {
  Future<Result<List<Crop>>> getCrops({bool refresh = false});
}
