import 'package:vocadb_app/services.dart';

class RestApiRepository {
  final HttpService httpService;

  RestApiRepository({this.httpService});

  Future<dynamic> getList(String endpoint, Map<String, dynamic> params) async {
    return httpService.get('$endpoint', params).then((v) => (v is Iterable)
        ? v
        : (v.containsKey('items'))
            ? v['items'] as Iterable
            : v);
  }

  Future<T> getObject<T>(String endpoint, Map<String, String> params) async {
    return httpService.get('$endpoint', params).then((v) => v as T);
  }
}
