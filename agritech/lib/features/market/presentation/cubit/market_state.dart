part of 'market_cubit.dart';

enum MarketStatus { initial, loading, success, error }

class MarketState extends Equatable {
  final MarketStatus status;
  final List<Price> items;
  final String? error;
  const MarketState({required this.status, required this.items, this.error});
  factory MarketState.initial() =>
      const MarketState(status: MarketStatus.initial, items: []);
  MarketState copyWith(
          {MarketStatus? status, List<Price>? items, String? error}) =>
      MarketState(
          status: status ?? this.status,
          items: items ?? this.items,
          error: error ?? this.error);
  @override
  List<Object?> get props => [status, items, error];
}
