import '../../../../core/storage/hive_manager.dart';

class IrrigationLocalSource {
  final HiveManager hive;
  IrrigationLocalSource(this.hive);
  static const key = 'irrigation';
  Future<void> cache(Map<String, dynamic> json) =>
      hive.put(HiveManager.irrigationBox, key, json);
  Future<Map<String, dynamic>?> read({Duration? ttl}) async {
    final map = await hive.get(HiveManager.irrigationBox, key, ttl: ttl);
    return map?['data']?.cast<String, dynamic>();
  }
}
