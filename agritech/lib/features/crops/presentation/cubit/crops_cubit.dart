// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../../core/utils/result.dart';
// import '../../domain/entities/crop.dart';
// import '../../domain/usecases/get_crops_usecase.dart';

// part 'crops_state.dart';

// class CropsCubit extends Cubit<CropsState> {
//   final GetCropsUseCase _getCrops;
//   CropsCubit(this._getCrops) : super(CropsState.initial());

//   Future<void> load() async {
//     emit(state.copyWith(status: CropsStatus.loading));
//     final Result<List<Crop>> res = await _getCrops();
//     res.fold(
//       (l) => emit(state.copyWith(status: CropsStatus.error, error: l.message)),
//       (r) => emit(state.copyWith(status: CropsStatus.success, items: r)),
//     );
//   }
// }


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecases/get_crops_usecase.dart';
import '../../../../core/network/network_service.dart';
import '../../domain/entities/crop.dart';

part 'crops_state.dart';

class CropsCubit extends Cubit<CropsState> {
  final GetCropsUseCase getCropsUseCase;
  final NetworkService networkService;

  CropsCubit(this.getCropsUseCase, this.networkService) : super(CropsState.initial()) {
    // Listen for network status changes
    networkService.onStatusChange.listen((online) {
      if (online) {
        refresh(); // Automatically refresh when network is back
      } else if (state.crops.isNotEmpty) {
        emit(CropsState.offline(state.crops));
      }
    });
  }

  /// Initial load
  Future<void> load() async {
    emit(CropsState.loading());

    final result = await getCropsUseCase();

    result.fold(
      (failure) => emit(CropsState.error("Failed to load crops")),
      (crops) => emit(CropsState.loaded(crops)),
    );
  }

  /// Refresh data (force fetch from API)
  Future<void> refresh() async {
    // Keep current crops while refreshing
    emit(state.copyWith(status: CropsStatus.loading, refreshed: true));

    final result = await getCropsUseCase(refresh: true);

    result.fold(
      (failure) {
        // Keep previous crops but show error
        emit(state.copyWith(status: CropsStatus.error, message: "Refresh failed", refreshed: false));
      },
      (crops) {
        emit(CropsState.loaded(crops, refreshed: true));
      },
    );
  }
}
