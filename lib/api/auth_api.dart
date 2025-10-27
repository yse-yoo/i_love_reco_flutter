import 'package:dio/dio.dart';
import 'client.dart';

class AuthApi {
  final dio = ApiClient.dio;

  Future<bool> login(String email, String password) async {
    final res = await dio.post('/login', data: {
      "email": email,
      "password": password,
    });

    final token = res.data['token'];
    await ApiClient.setToken(token);

    return true;
  }

  Future<Map<String, dynamic>> me() async {
    await ApiClient.attachAuthHeader();
    final res = await dio.get('/me');
    return res.data;
  }
}