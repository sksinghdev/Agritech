import '../../../../core/storage/hive_manager.dart';

class MarketLocalSource {
  final HiveManager hive;
  MarketLocalSource(this.hive);
  static const key = 'market';
  Future<void> cache(Map<String, dynamic> j) =>
      hive.put(HiveManager.marketBox, key, j);
  Future<Map<String, dynamic>?> read({Duration? ttl}) async {
    final m = await hive.get(HiveManager.marketBox, key, ttl: ttl);
    return m?['data']?.cast<String, dynamic>();
  }
}
