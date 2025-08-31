import '../../../../core/storage/hive_manager.dart';

class WeatherLocalSource {
  final HiveManager hive;
  WeatherLocalSource(this.hive);
  static const key = 'weather';
  Future<void> cache(Map<String, dynamic> json) =>
      hive.put(HiveManager.weatherBox, key, json);
  Future<Map<String, dynamic>?> read({Duration? ttl}) async {
    final map = await hive.get(HiveManager.weatherBox, key, ttl: ttl);
    return map?['data']?.cast<String, dynamic>();
  }
}
