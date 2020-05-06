import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:meta/meta.dart';
import 'package:vocadb/constants.dart';

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

    throw new Exception('Failed to load data!');
  }

  Future<dynamic> post(String endpoint, Map<String, String> params) async {
    String url = Uri.https(authority, endpoint, params).toString();
    final response = await dio.post(url, data: params);
    if (response.statusCode == 204) {
      return 'done';
    }

    throw new Exception('Failed to load data!');
  }
}
