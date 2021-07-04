import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb_app/exceptions.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/services.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('get', () {
    final mockDio = MockDio();
    test('return response if http call get successfully', () async {
      final mockResponseData = {"_id": "123", "name": "abc"};
      final mockResponse = Response(data: mockResponseData, statusCode: 200);

      when(mockDio.get(any, options: anyNamed('options')))
          .thenAnswer((_) async => Future.value(mockResponse));

      expect(
          await HttpService(dio: mockDio)
              .get('https://vocadb.net/api/songs/1', {
            'id': '1',
            'artistId[]': ['1', '2']
          }),
          mockResponseData);
    });

    test('return Exception if http call get error', () async {
      when(mockDio.get(any, options: anyNamed('options'))).thenAnswer(
          (_) async =>
              Future.value(Response(data: 'not found', statusCode: 404)));

      expect(
          () async => await HttpService(dio: mockDio)
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
          await HttpService(dio: mockDio)
              .post('https://vocadb.net/api/songs/1/rating', null),
          'done');
    });

    test('return Exception if http call post error', () async {
      when(mockDio.post(any)).thenAnswer((_) async => Future.value(Response(
          data: {"message": "Authorization has been denied for this request."},
          statusCode: 401)));

      expect(
          () async => await HttpService(dio: mockDio)
              .post('https://vocadb.net/api/songs/1/rating', null),
          throwsA(isException));
    });
  });

  group('login', () {
    final mockDio = MockDio();

    test('return cookie when login success', () async {
      final mockCookies = ['ASP.NET_SessionId=abc;', '.ASPXFORMSAUTH=1234'];
      final mockHeaders = Headers();
      mockHeaders.map.putIfAbsent('set-cookie', () => mockCookies);
      final mockResponse = Response(statusCode: 302, headers: mockHeaders);

      when(mockDio.post(any, data: anyNamed('data'))).thenAnswer(
          (_) async => Future.error(DioError(response: mockResponse)));

      UserCookie userCookie =
          await HttpService(dio: mockDio).login('user', 'password');

      expect(userCookie.cookies, mockCookies);
    });

    test('return exception when login success but no cookies', () async {
      final mockHeaders = Headers();
      final mockResponse = Response(statusCode: 302, headers: mockHeaders);

      when(mockDio.post(any, data: anyNamed('data'))).thenAnswer(
          (_) async => Future.error(DioError(response: mockResponse)));

      expect(
          () async =>
              await HttpService(dio: mockDio).login('user', 'wrong_password'),
          throwsA(TypeMatcher<DioError>()));
    });

    test('return Exception when login failed', () async {
      when(mockDio.post(any, data: anyNamed('data')))
          .thenAnswer((_) async => Future.value(Response(statusCode: 200)));

      expect(
          () async =>
              await HttpService(dio: mockDio).login('user', 'wrong_password'),
          throwsA(TypeMatcher<LoginFailedException>()));
    });

    test('return Exception when login error', () async {
      final mockResponse = Response(statusCode: 500);

      when(mockDio.post(any, data: anyNamed('data'))).thenAnswer(
          (_) async => Future.error(DioError(response: mockResponse)));

      expect(
          () async => await HttpService(dio: mockDio).login('user', 'password'),
          throwsA(TypeMatcher<DioError>()));
    });
  });
}
