import '../../../../core/network/api_service.dart';
import '../../../../core/network/endpoints.dart';

class MarketApiSource {
  final ApiService api;
  MarketApiSource(this.api);
  Future<Map<String, dynamic>> fetch() async =>
      (await api.get(Endpoints.marketPrices)).data;
}
