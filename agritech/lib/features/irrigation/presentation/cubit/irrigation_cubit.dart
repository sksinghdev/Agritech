import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/irrigation.dart';
import '../../domain/usecases/get_irrigation_usecase.dart';
part 'irrigation_state.dart';

class IrrigationCubit extends Cubit<IrrigationState> {
  final GetIrrigationUseCase useCase;
  IrrigationCubit(this.useCase) : super(IrrigationState.initial());
  Future<void> load() async {
    emit(state.copyWith(status: IrrigationStatus.loading));
    final res = await useCase();
    res.fold(
        (l) => emit(
            state.copyWith(status: IrrigationStatus.error, error: l.message)),
        (r) =>
            emit(state.copyWith(status: IrrigationStatus.success, items: r)));
  }
}
