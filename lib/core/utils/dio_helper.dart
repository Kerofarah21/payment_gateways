import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String endpoint,
    Map<String, dynamic>? query,
    String? token,
    String? contentType,
  }) async {
    return await dio!.get(
      endpoint,
      options: Options(
        contentType: contentType ?? 'application/json',
        headers: {
          'Authorization': "Bearer $token",
        },
      ),
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String endpoint,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
    String? contentType,
  }) async {
    return await dio!.post(
      endpoint,
      options: Options(
        contentType: contentType ?? 'application/json',
        headers: {
          'Authorization': "Bearer $token",
        },
      ),
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String endpoint,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
    String? contentType,
  }) async {
    return await dio!.put(
      endpoint,
      options: Options(
        contentType: contentType ?? 'application/json',
        headers: {
          'Authorization': "Bearer $token",
        },
      ),
      queryParameters: query,
      data: data,
    );
  }
}
