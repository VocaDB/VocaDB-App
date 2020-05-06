import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:meta/meta.dart';
import 'package:vocadb/constants.dart';
import 'package:vocadb/exceptions/exceptions.dart';

class VocaDBApiClient {
  final Dio dio;

  VocaDBApiClient({@required this.dio}) : assert(dio != null);

  Future<dynamic> get(String endpoint, Map<String, String> params) async {
    String url = Uri.https(authority, endpoint, params).toString();
    final response =
        await dio.get(url, options: buildCacheOptions(Duration(minutes: 5)));

    if (response.statusCode == 200) {
      return response.data;
    }

    throw HttpRequestErrorException();
  }

  Future<dynamic> post(String endpoint, Map<String, String> params) async {
    String url = Uri.https(authority, endpoint, params).toString();
    final response = await dio.post(url, data: params);

    if (response.statusCode == 204) {
      return 'done';
    }

    throw HttpRequestErrorException();
  }

  Future<dynamic> login(String username, String password) async {
    String url = Uri.https(authority, '/User/Login').toString();
    try {
      await dio.post(url, data: {'UserName': username, 'Password': password});
      throw LoginFailedException();
    } catch (e) {
      if (e is DioError && e.response.statusCode == 302) {
        return e.response;
      }

      throw e;
    }
  }
}
