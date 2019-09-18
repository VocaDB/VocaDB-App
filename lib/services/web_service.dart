import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

const host = 'https://vocadb.net';

class Resource<T> {
  final String url;
  final String endpoint;
  final Map<String, dynamic> params;
  T Function(Response response) parse;

  Resource({this.url, this.endpoint, this.parse, this.params});
}

class WebService {
  Future<T> load<T>(Resource<T> resource) async {
    String actualUrl =
        (resource.url == null) ? host + resource.endpoint : resource.url;

    final response = await http.get(actualUrl);
    if (response.statusCode == 200) {
      return resource.parse(response);
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
