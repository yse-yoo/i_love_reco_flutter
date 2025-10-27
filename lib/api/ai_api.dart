import 'package:dio/dio.dart';
import 'client.dart';

class AiApi {
  final dio = ApiClient.dio;

  Future<Map<String, dynamic>> askAi(
    String mood, {
    bool testMode = false,
  }) async {
    await ApiClient.attachAuthHeader();
    final res = await dio.post(
      '/ai',
      data: {"mood": mood, "mode": "food", "test": testMode},
    );

    final data = res.data ?? {};
    return {
      "reply": data["reply"] ?? "", // ← null対策
      "foods": data["foods"] ?? [],
      "movies": data["movies"] ?? [],
      "songs": data["songs"] ?? [],
    };
  }
}
