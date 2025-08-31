import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/result.dart';
import '../../domain/entities/crop.dart';
import '../../domain/usecases/get_crops_usecase.dart';

part 'crops_state.dart';

class CropsCubit extends Cubit<CropsState> {
  final GetCropsUseCase _getCrops;
  CropsCubit(this._getCrops) : super(CropsState.initial());

  Future<void> load() async {
    emit(state.copyWith(status: CropsStatus.loading));
    final Result<List<Crop>> res = await _getCrops();
    res.fold(
      (l) => emit(state.copyWith(status: CropsStatus.error, error: l.message)),
      (r) => emit(state.copyWith(status: CropsStatus.success, items: r)),
    );
  }
}
