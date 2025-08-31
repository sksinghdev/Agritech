import 'package:hive_flutter/hive_flutter.dart';

class HiveManager {
  static const cropsBox = 'crops_box';
  static const weatherBox = 'weather_box';
  //static const irrigationBox = 'irrigation_box';
 // static const marketBox = 'market_box';

  Future<Box> _open(String name) async => await Hive.openBox(name);

  Future<void> put(String box, String key, dynamic value) async {
    final b = await _open(box);
    await b.put(key, {
      'ts': DateTime.now().millisecondsSinceEpoch,
      'data': value,
    });
  }

  Future<Map<String, dynamic>?> get(String box, String key,
      {Duration? ttl}) async {
    final b = await _open(box);
    final map = (b.get(key) as Map?)?.cast<String, dynamic>();
    if (map == null) return null;
    if (ttl != null) {
      final ts = map['ts'] as int?;
      if (ts != null &&
          DateTime.now().millisecondsSinceEpoch - ts > ttl.inMilliseconds) {
        await b.delete(key);
        return null;
      }
    }
    return map;
  }
}
