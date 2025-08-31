import '../../../../core/network/api_service.dart';
import '../../../../core/network/endpoints.dart';

class IrrigationApiSource {
  final ApiService api;
  IrrigationApiSource(this.api);
  Future<Map<String, dynamic>> fetch() async =>
      (await api.get(Endpoints.irrigation)).data;
}
