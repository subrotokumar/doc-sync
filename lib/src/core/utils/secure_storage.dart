import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static FlutterSecureStorage _storage = const FlutterSecureStorage();

  SecureStorage._internal() {
    _storage = const FlutterSecureStorage();
  }

  static FlutterSecureStorage get instance {
    return _storage;
  }

  static Future<String?> get getRefreshToken async =>
      await _storage.read(key: 'refreshToken');

  static Future<void> setRefreshToken(String value) {
    return _storage.write(key: 'refreshToken', value: value);
  }
}
