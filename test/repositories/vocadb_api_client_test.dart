import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb/repositories/vocadb_api_client.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('assertion', () {
    test('should assert if null', () {
      expect(
        () => VocaDBApiClient(dio: null),
        throwsA(isAssertionError),
      );
    });
  });

  group('get', () {
    final mockDio = MockDio();
    test('return response if http call get successfully', () async {
      final mockResponseData = {"_id": "123", "name": "abc"};
      final mockResponse = Response(data: mockResponseData, statusCode: 200);

      when(mockDio.get(any, options: anyNamed('options')))
          .thenAnswer((_) async => Future.value(mockResponse));

      expect(
          await VocaDBApiClient(dio: mockDio)
              .get('https://vocadb.net/api/songs/1', null),
          mockResponseData);
    });

    test('return Exception if http call get error', () async {
      when(mockDio.get(any, options: anyNamed('options'))).thenAnswer(
          (_) async =>
              Future.value(Response(data: 'not found', statusCode: 404)));

      expect(
          () async => await VocaDBApiClient(dio: mockDio)
              .get('https://vocadb.net/api/songs/x', null),
          throwsA(isException));
    });
  });

  group('post', () {
    final mockDio = MockDio();
    test('return response if http call post successfully', () async {
      final mockBodyData = {"id": "123", "rating": "Like"};
      final mockResponse = Response(data: mockBodyData, statusCode: 204);

      when(mockDio.post(any))
          .thenAnswer((_) async => Future.value(mockResponse));

      expect(
          await VocaDBApiClient(dio: mockDio)
              .post('https://vocadb.net/api/songs/1/rating', null),
          'done');
    });

    test('return Exception if http call post error', () async {
      when(mockDio.post(any)).thenAnswer((_) async => Future.value(Response(
          data: {"message": "Authorization has been denied for this request."},
          statusCode: 401)));

      expect(
          () async => await VocaDBApiClient(dio: mockDio)
              .post('https://vocadb.net/api/songs/1/rating', null),
          throwsA(isException));
    });
  });
}
