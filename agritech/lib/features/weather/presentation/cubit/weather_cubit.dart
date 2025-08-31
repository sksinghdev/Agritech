import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/weather.dart';
import '../../domain/usecases/get_weather_usecase.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherUseCase getWeather;
  WeatherCubit(this.getWeather) : super(WeatherState.initial());
  Future<void> load() async {
    emit(state.copyWith(status: WeatherStatus.loading));
    final res = await getWeather();
    res.fold(
      (l) =>
          emit(state.copyWith(status: WeatherStatus.error, error: l.message)),
      (r) => emit(state.copyWith(status: WeatherStatus.success, data: r)),
    );
  }
}
