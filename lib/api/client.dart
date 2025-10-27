import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://10.0.2.2:5000/api", // Android Emulator → localhost
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      contentType: "application/json",
    ),
  );

  static const _storage = FlutterSecureStorage();

  static Future<String?> get token => _storage.read(key: 'token');

  static Future<void> setToken(String token) =>
      _storage.write(key: 'token', value: token);

  static Future<void> clearToken() => _storage.delete(key: 'token');

  static Future<void> attachAuthHeader() async {
    final t = await token;
    if (t != null) {
      dio.options.headers['Authorization'] = 'Bearer $t';
    }
  }
}
