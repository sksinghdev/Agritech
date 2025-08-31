import '../../../../core/storage/hive_manager.dart';

class CropsLocalSource {
  final HiveManager _hive;
  CropsLocalSource(this._hive);
  static const key = 'crops';

  Future<void> cache(Map<String, dynamic> json) =>
      _hive.put(HiveManager.cropsBox, key, json);

  Future<Map<String, dynamic>?> read({Duration? ttl}) async {
    final map = await _hive.get(HiveManager.cropsBox, key, ttl: ttl);
    return map?['data']?.cast<String, dynamic>();
  }
}
