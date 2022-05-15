import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageConstants {
  static const _secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  static const String username = 'username';
  static const String password = 'password';

  static Future<Map<String, dynamic>> getAllValue() async {
    return await _secureStorage.readAll();
  }

  static Future<String> getString(String key) async {
    return await _secureStorage.read(key: key) ?? '';
  }

  static Future setString(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  static Future deleteAll() async {
    await _secureStorage.deleteAll();
  }

  static Future deleteKey(String key) async {
    await _secureStorage.delete(key: key);
  }
}
