import '../../../../core/network/api_service.dart';
import '../../../../core/network/endpoints.dart';

class WeatherApiSource {
  final ApiService api;
  WeatherApiSource(this.api);
  Future<Map<String, dynamic>> fetch() async =>
      (await api.get(Endpoints.weather)).data;
}
