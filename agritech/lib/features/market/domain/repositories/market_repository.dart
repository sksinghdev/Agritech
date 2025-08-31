import '../../../../core/utils/result.dart';
import '../entities/price.dart';

abstract class MarketRepository {
  Future<Result<List<Price>>> getPrices();
}
