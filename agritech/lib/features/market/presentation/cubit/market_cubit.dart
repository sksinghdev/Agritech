import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/price.dart';
import '../../domain/usecases/get_market_prices_usecase.dart';
part 'market_state.dart';

class MarketCubit extends Cubit<MarketState> {
  final GetMarketPricesUseCase useCase;
  MarketCubit(this.useCase) : super(MarketState.initial());
  Future<void> load() async {
    emit(state.copyWith(status: MarketStatus.loading));
    final res = await useCase();
    res.fold(
        (l) =>
            emit(state.copyWith(status: MarketStatus.error, error: l.message)),
        (r) => emit(state.copyWith(status: MarketStatus.success, items: r)));
  }
}
