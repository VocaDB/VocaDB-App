import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/api/api_client.dart';

import '../../mocks.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(FakeUri());
  });
  group('ApiClient.get', () {
    test('json format and without query parameters', () async {
      final httpClient = MockClient();
      final restApiClient = ApiClient(host: 'vocadb.net', client: httpClient);

      const body = '{"id": 1}';
      when(() => httpClient.get(any()))
          .thenAnswer((_) => Future.value(Response(body, 200)));

      final expected = {"id": 1};
      final actualResult = restApiClient.get('/api/something');

      expectLater(actualResult, completion(expected));
    });

    test('non-json format and without query parameters', () async {
      final httpClient = MockClient();
      final restApiClient = ApiClient(host: 'vocadb.net', client: httpClient);

      const body = 'testResponse';
      when(() => httpClient.get(any()))
          .thenAnswer((_) => Future.value(Response(body, 200)));

      const expected = 'testResponse';
      final actualResult = restApiClient.get('/api/something', json: false);

      expectLater(actualResult, completion(expected));
    });

    test('json and with parameters success', () async {
      final httpClient = MockClient();
      final restApiClient = ApiClient(host: 'vocadb.net', client: httpClient);

      const body = '{"id": 1}';
      when(() => httpClient.get(any())).thenAnswer(
        (_) => Future.value(Response(body, 200)),
      );

      final expected = {"id": 1};
      final actualResult = restApiClient.get(
        '/api/something',
        params: {'id': 39, 'query': 'miku'},
      );

      expectLater(actualResult, completion(expected));
    });

    test('throws http exception when response status code is error', () async {
      final httpClient = MockClient();
      final restApiClient = ApiClient(host: 'vocadb.net', client: httpClient);

      when(() => httpClient.get(any())).thenAnswer(
        (_) => Future.value(Response('Error', 404)),
      );

      expectLater(
        restApiClient.get('/api/something'),
        throwsA(predicate((e) => e is HttpException)),
      );
    });
  });
}
