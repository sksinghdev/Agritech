part of 'crops_cubit.dart';

enum CropsStatus { initial, loading, loaded, error, offline }

class CropsState extends Equatable {
  final CropsStatus status;
  final List<Crop> crops;
  final String? message;
  final bool refreshed;  
  final bool offline;  

  const CropsState({
    required this.status,
    this.crops = const [],
    this.message,
    this.refreshed = false,
    this.offline = false,
  });

  factory CropsState.initial() => const CropsState(status: CropsStatus.initial);

  factory CropsState.loading() => const CropsState(status: CropsStatus.loading);

  factory CropsState.loaded(List<Crop> crops, {bool refreshed = false}) =>
      CropsState(status: CropsStatus.loaded, crops: crops, refreshed: refreshed);

  factory CropsState.error(String message) =>
      CropsState(status: CropsStatus.error, message: message);

  factory CropsState.offline(List<Crop> crops) =>
      CropsState(status: CropsStatus.offline, crops: crops, offline: true);

  CropsState copyWith({
    CropsStatus? status,
    List<Crop>? crops,
    String? message,
    bool? refreshed,
    bool? offline,
  }) {
    return CropsState(
      status: status ?? this.status,
      crops: crops ?? this.crops,
      message: message ?? this.message,
      refreshed: refreshed ?? this.refreshed,
      offline: offline ?? this.offline,
    );
  }

  @override
  List<Object?> get props => [status, crops, message, refreshed, offline];
}
