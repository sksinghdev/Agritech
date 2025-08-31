import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/price.dart';
import '../../domain/repositories/market_repository.dart';
import '../models/price_model.dart';
import '../sources/market_api_source.dart';
import '../sources/market_local_source.dart';

class MarketRepositoryImpl implements MarketRepository {
  final MarketApiSource api;
  final MarketLocalSource local;
  MarketRepositoryImpl(this.api, this.local);
  @override
  Future<Result<List<Price>>> getPrices() async {
    try {
      final cached = await local.read(ttl: const Duration(hours: 6));
      if (cached != null) return Right(PriceModel.listFromJson(cached));
      final json = await api.fetch();
      await local.cache(json);
      return Right(PriceModel.listFromJson(json));
    } catch (e) {
      return Left(NetworkFailure(e.toString()));
    }
  }
}
