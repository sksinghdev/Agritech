part of 'irrigation_cubit.dart';

enum IrrigationStatus { initial, loading, success, error }

class IrrigationState extends Equatable {
  final IrrigationStatus status;
  final List<FieldSchedule> items;
  final String? error;
  const IrrigationState(
      {required this.status, required this.items, this.error});
  factory IrrigationState.initial() =>
      const IrrigationState(status: IrrigationStatus.initial, items: []);
  IrrigationState copyWith(
          {IrrigationStatus? status,
          List<FieldSchedule>? items,
          String? error}) =>
      IrrigationState(
          status: status ?? this.status,
          items: items ?? this.items,
          error: error ?? this.error);
  @override
  List<Object?> get props => [status, items, error];
}
