import '../../../../core/utils/result.dart';
import '../entities/price.dart';
import '../repositories/market_repository.dart';

class GetMarketPricesUseCase {
  final MarketRepository repo;
  GetMarketPricesUseCase(this.repo);
  Future<Result<List<Price>>> call() => repo.getPrices();
}
