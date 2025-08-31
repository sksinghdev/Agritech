import '../../../../core/utils/result.dart';
import '../entities/crop.dart';
import '../repositories/crops_repository.dart';

class GetCropsUseCase {
  final CropsRepository repo;
  GetCropsUseCase(this.repo);
  Future<Result<List<Crop>>> call() => repo.getCrops();
}
