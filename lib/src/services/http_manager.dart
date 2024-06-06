import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class HttpMethods {
  static const String post = 'POST';
  static const String get = 'GET';
  static const String put = 'PUT';
  static const String delete = 'DELETE';
}

class HttpManager {
  final dio = Dio();

  Future<Map> request({
    required String url,
    String? method,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    dio.options = BaseOptions(
      baseUrl: dotenv.env['BASE_URL']!,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-Parse-Application-Id': dotenv.env['X_PARSE_APPLICATION_ID'],
        'X-Parse-REST-API-Key': dotenv.env['X_PARSE_REST_API_KEY'],
      },
      method: method ?? HttpMethods.get,
    );

    if (headers != null) {
      dio.options.headers.addAll(headers);
    }

    try {
      Response response = await dio.request(url, data: body);
      if (onSuccess != null) {
        onSuccess(response.data);
      }
      return response.data;
    } on DioException catch (e) {
      // dio request error
      if (onError != null) {
        onError(e.response);
      }
      return e.response?.data ?? {};
    } catch (e) {
      // general request error
      return {};
    }
  }
}

// export instance
final httpManager = HttpManager();
