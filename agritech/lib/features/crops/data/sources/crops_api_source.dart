import '../../../../core/network/api_service.dart';
import '../../../../core/network/endpoints.dart';

class CropsApiSource {
  final ApiService _api;
  CropsApiSource(this._api);
  Future<Map<String, dynamic>> fetch() async {
    final res = await _api.get(Endpoints.crops);
    return res.data as Map<String, dynamic>;
  }
}
