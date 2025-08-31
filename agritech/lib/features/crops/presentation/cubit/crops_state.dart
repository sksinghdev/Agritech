part of 'crops_cubit.dart';


enum CropsStatus { initial, loading, success, error }


class CropsState extends Equatable {
final CropsStatus status;
final List<Crop> items;
final String? error;
const CropsState({required this.status, required this.items, this.error});


factory CropsState.initial() => const CropsState(status: CropsStatus.initial, items: []);


CropsState copyWith({CropsStatus? status, List<Crop>? items, String? error}) =>
CropsState(status: status ?? this.status, items: items ?? this.items, error: error ?? this.error);


@override
List<Object?> get props => [status, items, error];
}