import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vocadb_app/constants.dart';
import 'package:vocadb_app/exceptions.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/utils.dart';

class HttpService extends GetxService {
  Dio _dio;
  AppDirectory _appDirectory;

  HttpService({Dio dio, AppDirectory appDirectory})
      : this._dio = dio,
        this._appDirectory = appDirectory;

  Future<HttpService> init() async {
    _dio = Dio();
    _dio.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: baseUrl)).interceptor);
    _dio.interceptors.add(CookieManager(
        PersistCookieJar(dir: _appDirectory.cookiesDirectory.path)));
    return this;
  }

  Future<dynamic> get(String endpoint, Map<String, String> params) async {
    params?.removeWhere((key, value) => value == null || value.isEmpty);

    String url = Uri.https(authority, endpoint, params).toString();
    print('GET $url | $params');
    final response =
        await _dio.get(url, options: buildCacheOptions(Duration(minutes: 5)));

    if (response.statusCode == 200) {
      return response.data;
    }

    throw HttpRequestErrorException();
  }

  Future<dynamic> post(String endpoint, Map<String, String> params) async {
    params?.removeWhere((key, value) => value == null || value.isEmpty);
    String url = Uri.https(authority, endpoint).toString();

    print('POST $url | $params');

    final response = await _dio.post(
      url,
      data: params,
    );

    if (response.statusCode == 204) {
      return 'done';
    } else {
      print(response.statusMessage);
    }

    throw HttpRequestErrorException();
  }

  Future<UserCookie> login(String username, String password) async {
    String url = Uri.https(authority, '/User/Login').toString();
    try {
      await _dio.post(url, data: {'UserName': username, 'Password': password});
      throw LoginFailedException();
    } catch (e) {
      if (e is DioError && e.response.statusCode == 302) {
        List<String> cookies = e.response.headers.map['set-cookie'];

        if (cookies != null && !cookies.isEmpty) {
          return UserCookie(cookies: cookies);
        }
      }

      throw e;
    }
  }
}
