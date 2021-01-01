import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vocadb_app/constants.dart';
import 'package:vocadb_app/utils.dart';

class HttpService extends GetxService {
  Dio _dio;

  Future<HttpService> init() async {
    AppDirectory appDirectory = AppDirectory(
        applicationDocument: await getApplicationDocumentsDirectory());
    _dio = Dio();
    _dio.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: baseUrl)).interceptor);
    _dio.interceptors.add(CookieManager(
        PersistCookieJar(dir: appDirectory.cookiesDirectory.path)));
    return this;
  }

  Future<dynamic> get(String endpoint, Map<String, String> params) async {
    params?.removeWhere((key, value) => value == null || value.isEmpty);

    String url = Uri.https(authority, endpoint, params).toString();
    print('$url | $params');
    final response =
        await _dio.get(url, options: buildCacheOptions(Duration(minutes: 5)));

    if (response.statusCode == 200) {
      return response.data;
    }

    throw Error();
  }
}
