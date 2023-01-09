import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/api/api_client.dart';

import '../../mocks.dart';

void main() {
  late Client httpClient;
  late ApiClient apiClient;

  setUpAll(() {
    registerFallbackValue(FakeUri());
  });

  setUp(() {
    httpClient = MockClient();
    apiClient = ApiClient(host: 'vocadb.net', client: httpClient);
  });
  group('ApiClient.get', () {
    test('json format and without query parameters', () async {
      const body = '{"id": 1}';

      // Mock
      callGet() => httpClient.get(any());

      when(callGet).thenAnswer((_) => Future.value(Response(body, 200)));

      final expected = {"id": 1};
      final response = await apiClient.get('/api/something');

      expect(response, expected);

      verify(callGet).called(1);
    });

    test('non-json format and without query parameters', () async {
      const body = 'testResponse';

      // Mock
      callGet() => httpClient.get(any());

      when(callGet).thenAnswer((_) => Future.value(Response(body, 200)));

      const expected = 'testResponse';
      final response = await apiClient.get('/api/something', json: false);

      expect(response, expected);

      verify(callGet).called(1);
    });

    test('json and with parameters success', () async {
      const body = '{"id": 1}';

      // Mock
      callGet() => httpClient.get(any());

      when(callGet).thenAnswer(
        (_) => Future.value(Response(body, 200)),
      );

      final expected = {"id": 1};
      final response = await apiClient.get(
        '/api/something',
        params: {'id': 39, 'query': 'miku'},
      );

      expect(response, expected);

      verify(callGet).called(1);
    });

    test('throws http exception when response status code is error', () async {
      // Mock
      callGet() => httpClient.get(any());

      when(callGet).thenAnswer(
        (_) => Future.value(Response('Error', 404)),
      );

      expectLater(
        apiClient.get('/api/something'),
        throwsA(predicate((e) => e is HttpException)),
      );
    });
  });

  group('ApiClient.post', () {
    test('success', () async {
      final expectedResponse = Response('success', 200);
      callPost() => httpClient.post(any());

      when(callPost).thenAnswer((_) => Future.value(expectedResponse));

      final response = await apiClient.post('/api/something');

      expect(response, expectedResponse);

      verify(callPost).called(1);
    });

    test('throws http exception when response status code is error', () async {
      final response = Response('Error', 400);
      callPost() => httpClient.post(any());

      when(callPost).thenAnswer((_) => Future.value(response));

      expectLater(
        apiClient.post('/api/something'),
        throwsA(predicate((e) => e is HttpException)),
      );

      verify(callPost).called(1);
    });
  });
}
