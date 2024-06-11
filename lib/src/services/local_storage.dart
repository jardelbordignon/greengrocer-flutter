import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  final _storage = const FlutterSecureStorage();

  Future<String?> get(String key) async {
    String? storedData = await _storage.read(key: key);
    //print('localStorage.get data:\n$storedData');

    if (storedData == null || storedData.isEmpty) return null;
    Map<String, dynamic> data = Map.from(jsonDecode(storedData));

    final bool isExpired = data.containsKey('expiresIn') &&
        DateTime.parse(data['expiresIn']).isBefore(DateTime.now());

    if (isExpired) {
      await _storage.delete(key: key);
      return null;
    }
    return data['value'];
  }

  Future<void> set(String key, String value, {int? ttlMinutes}) async {
    Map<String, dynamic> data = ttlMinutes != null
        ? {
            'value': value,
            'expiresIn':
                DateTime.now().add(Duration(minutes: ttlMinutes)).toString(),
          }
        : {'value': value};
    await _storage.write(key: key, value: jsonEncode(data));
    //print('localStorage.set data:\n$data');
  }

  Future<bool> containsKey(String key) async {
    return _storage.containsKey(key: key);
  }

  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}

// export instance
LocalStorage localStorage = LocalStorage();
