import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/exceptions/require_login_exception.dart';
import 'package:vocadb_app/src/features/api/api_cache.dart';
import 'package:vocadb_app/src/features/api/api_client.dart';
import 'package:vocadb_app/src/features/api/data/cookie_storage.dart';

import '../../mocks.dart';

void main() {
  late Client httpClient;
  late ApiClient apiClient;
  late ApiCache apiCache;
  late CookieStorage cookieStorage;
  const host = 'unittest.net';

  setUpAll(() {
    registerFallbackValue(FakeUri());
  });

  setUp(() {
    httpClient = MockClient();
    apiCache = MockApiCache();
    cookieStorage = MockCookieStorage();
    apiClient = ApiClient(
      host: host,
      client: httpClient,
      apiCache: apiCache,
      cookieStorage: cookieStorage,
    );
  });
  group('ApiClient.get', () {
    test('json format and without query parameters', () async {
      const body = '{"id": 1}';

      // Mock
      callGet() => httpClient.get(any());

      when(callGet).thenAnswer((_) => Future.value(Response(body, 200)));

      final expected = {"id": 1};
      final response = await apiClient.get('/api/something', cache: false);

      expect(response, expected);

      verify(callGet).called(1);
    });

    test('non-json format and without query parameters', () async {
      const body = 'testResponse';

      // Mock
      callGet() => httpClient.get(any());

      when(callGet).thenAnswer((_) => Future.value(Response(body, 200)));

      const expected = 'testResponse';
      final response =
          await apiClient.get('/api/something', json: false, cache: false);

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
      final response = await apiClient.get('/api/something',
          params: {'id': 39, 'query': 'miku'}, cache: false);

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
        apiClient.get('/api/something', cache: false),
        throwsA(predicate((e) => e is HttpException)),
      );
    });
    test('get from cache as map', () async {
      const body = '{"id": 1}';

      // Mock
      callGet() => httpClient.get(any());
      callGetFromCache() => apiCache.get(any());

      when(callGetFromCache).thenAnswer((_) => Future.value(body));

      final expected = {"id": 1};
      final response = await apiClient.get('/api/something');

      expect(response, expected);

      verifyNever(callGet);
      verify(callGetFromCache).called(1);
      verifyNever(() => apiCache.put(any(), any()));
    });
    test('get from API and save cache when cache not found', () async {
      const body = '{"id": 1}';

      // Mock
      callGet() => httpClient.get(any());
      callGetFromCache() => apiCache.get(any());
      callSaveCache() => apiCache.put(any(), any());

      when(callGetFromCache).thenAnswer((_) => Future.value(""));
      when(callGet).thenAnswer((_) => Future.value(Response(body, 200)));
      when(callSaveCache).thenAnswer((_) => Future.value());

      final expected = {"id": 1};
      final response = await apiClient.get('/api/something');

      expect(response, expected);

      verify(callGet).called(1);
      verify(callGetFromCache).called(1);
      verify(callSaveCache).called(1);
    });
  });

  group('ApiClient.post', () {
    test('success', () async {
      final expectedResponse = Response('success', 200);

      callGetCookie() => cookieStorage.get();
      when(callGetCookie).thenAnswer((_) => Future.value('cookieValue'));

      callPost() => httpClient.post(
            Uri.https(host, '/api/something'),
            body: 'bodystring',
            headers: {
              'Cookie': 'cookieValue',
              'Content-Type': 'application/json'
            },
          );
      when(callPost).thenAnswer((_) => Future.value(expectedResponse));

      final response =
          await apiClient.post('/api/something', body: 'bodystring');

      expect(response, expectedResponse);

      verify(callGetCookie).called(1);
      verify(callPost).called(1);
    });

    test('throws RequireLoginException when cookie is empty', () async {
      callGetCookie() => cookieStorage.get();
      when(callGetCookie).thenAnswer((_) => Future.value(''));

      expectLater(
        apiClient.post('/api/something', body: 'bodystring'),
        throwsA(predicate((e) => e is RequireLoginException)),
      );
    });

    test('throws http exception when response status code is error', () async {
      callGetCookie() => cookieStorage.get();
      when(callGetCookie).thenAnswer((_) => Future.value('cookieValue'));

      callPost() => httpClient.post(
            Uri.https(host, '/api/something'),
            body: 'bodystring',
            headers: {
              'Cookie': 'cookieValue',
              'Content-Type': 'application/json'
            },
          );
      when(callPost).thenAnswer((_) => Future.value(Response('Error', 400)));

      expectLater(
        apiClient.post('/api/something', body: 'bodystring'),
        throwsA(predicate((e) => e is HttpException)),
      );

      verify(callGetCookie).called(1);
    });
  });

  group('fetchCookieToken', () {
    // Mock
    callGetToken() => httpClient.get(Uri.https(host, '/api/antiforgery/token'));

    test('Fetch token success with set-cookie exists in response headers',
        () async {
      when(callGetToken).thenAnswer((_) => Future.value(
          Response('', 204, headers: {'set-cookie': 'cookieValue'})));

      final cookie = await apiClient.fetchCookieToken();

      expect(cookie, 'cookieValue');
    });
    test('Fetch token with HTTP error', () async {
      when(callGetToken).thenAnswer((_) => Future.value(Response('', 400)));

      expectLater(apiClient.fetchCookieToken(),
          throwsA(predicate((e) => e is HttpException)));
    });
    test('Fetch token success and set-cookie not found in response headers',
        () async {
      when(callGetToken).thenAnswer((_) => Future.value(Response('', 204)));
      expectLater(apiClient.fetchCookieToken(),
          throwsA(predicate((e) => e is HttpException)));
    });
  });

  group('authGet', () {
    callGetCookie() => cookieStorage.get();

    test('success when cookie exists', () async {
      when(callGetCookie).thenAnswer((_) => Future.value('cookieValue'));
      when(() => httpClient.get(
            Uri.https(host, '/api/anything'),
            headers: {
              'Cookie': 'cookieValue',
              'Content-Type': 'application/json',
            },
          )).thenAnswer((_) => Future.value(Response('{"id": 1}', 200)));

      final result = await apiClient.authGet('/api/anything');
      expect(result, {'id': 1});
    });

    test('error when cookie is empty', () async {
      when(callGetCookie).thenAnswer((_) => Future.value(''));

      expectLater(apiClient.authGet('/api/anything'),
          throwsA(predicate((e) => e is RequireLoginException)));

      verifyNever(() =>
          httpClient.get(any(), headers: any(named: 'headers', that: isMap)));
    });

    test('error when response is not ok', () async {
      when(callGetCookie).thenAnswer((_) => Future.value('cookieValue'));
      when(() => httpClient.get(
            Uri.https(host, '/api/anything'),
            headers: {
              'Cookie': 'cookieValue',
              'Content-Type': 'application/json',
            },
          )).thenAnswer((_) => Future.value(Response('', 400)));

      expectLater(apiClient.authGet('/api/anything'),
          throwsA(predicate((e) => e is HttpException)));
    });
  });

  group('login', () {
    const validCookie =
        '.AspNetCore.Antiforgery.D1xlUe6EjVo=CfDJ8LqE1qELWY5OoSDCgE4RsNCvwEAeRx3JOc5-1THE8v1b-OSJd1U-VF0bcK4gyHZt-xtiVXze7sPMP-fIo93J6aht_wBGNgecYxIi1yul0S_bYmMbEWipMjqtukW1ElK4Jo8_fJRVq1hd6Zf1ccAPqgI; path=/; samesite=strict; httponly,XSRF-TOKEN=MOCK-TOKEN; path=/';
    test('success', () async {
      // Mock Get token Success
      callGetToken() =>
          httpClient.get(Uri.https(host, '/api/antiforgery/token'));
      when(callGetToken).thenAnswer((_) => Future.value(Response(
            '',
            204,
            headers: {'set-cookie': validCookie},
          )));

      // Mock Login Success
      callLogin() => httpClient.post(
            Uri.https(host, '/api/users/login'),
            body: jsonEncode({
              'keepLoggedIn': true,
              'username': 'user',
              'password': 'pass',
            }),
            headers: {
              'requestverificationtoken': 'MOCK-TOKEN',
              'Cookie': validCookie,
              'Content-Type': 'application/json'
            },
          );
      when(callLogin).thenAnswer((_) => Future.value(Response('', 204)));

      // Mock save cookie
      callSaveCookie() => cookieStorage.save(validCookie);
      when(callSaveCookie).thenAnswer((_) => Future.value());

      await apiClient.login('user', 'pass');

      verify(callGetToken).called(1);
      verify(callLogin).called(1);
      verify(callSaveCookie).called(1);
    });
    test('error when XSRF-TOKEN not exists in cookie', () async {
      const missingXSRFCookie =
          '.AspNetCore.Antiforgery.D1xlUe6EjVo=CfDJ8LqE1qELWY5OoSDCgE4RsNCvwEAeRx3JOc5-1THE8v1b-OSJd1U-VF0bcK4gyHZt-xtiVXze7sPMP-fIo93J6aht_wBGNgecYxIi1yul0S_bYmMbEWipMjqtukW1ElK4Jo8_fJRVq1hd6Zf1ccAPqgI; path=/; samesite=strict; httponly; path=/';

      // Mock Get token Success
      callGetToken() =>
          httpClient.get(Uri.https(host, '/api/antiforgery/token'));
      when(callGetToken).thenAnswer((_) => Future.value(Response(
            '',
            204,
            headers: {'set-cookie': missingXSRFCookie},
          )));

      try {
        await apiClient.login('user', 'pass');
        fail('exception not thrown');
      } catch (e) {
        expect(e, isA<HttpException>());
        verify(callGetToken).called(1);
        verifyNever(() => httpClient.post(any()));
        verifyNever(() => cookieStorage.save(any()));
      }
    });
    test('error when HTTP response is not ok', () async {
      // Mock Get Token
      callGetToken() =>
          httpClient.get(Uri.https(host, '/api/antiforgery/token'));
      when(callGetToken).thenAnswer((_) => Future.value(Response(
            '',
            204,
            headers: {'set-cookie': validCookie},
          )));

      // Mock Login Success
      callLogin() => httpClient.post(
            Uri.https(host, '/api/users/login'),
            body: jsonEncode({
              'keepLoggedIn': true,
              'username': 'user',
              'password': 'pass',
            }),
            headers: {
              'requestverificationtoken': 'MOCK-TOKEN',
              'Cookie': validCookie,
              'Content-Type': 'application/json'
            },
          );
      when(callLogin).thenAnswer((_) => Future.value(Response('', 400)));

      try {
        await apiClient.login('user', 'pass');
        fail('exception not thrown');
      } catch (e) {
        expect(e, isA<HttpException>());
        verify(callGetToken).called(1);
        verify(callLogin).called(1);
        verifyNever(() => cookieStorage.save(any()));
      }
    });
  });

  group('logout', () {
    const validCookie =
        '.AspNetCore.Antiforgery.D1xlUe6EjVo=CfDJ8LqE1qELWY5OoSDCgE4RsNCvwEAeRx3JOc5-1THE8v1b-OSJd1U-VF0bcK4gyHZt-xtiVXze7sPMP-fIo93J6aht_wBGNgecYxIi1yul0S_bYmMbEWipMjqtukW1ElK4Jo8_fJRVq1hd6Zf1ccAPqgI; path=/; samesite=strict; httponly,XSRF-TOKEN=MOCK-TOKEN; path=/';
    test('success', () async {
      callGetToken() =>
          httpClient.get(Uri.https(host, '/api/antiforgery/token'));
      when(callGetToken).thenAnswer((_) => Future.value(Response(
            '',
            204,
            headers: {'set-cookie': validCookie},
          )));

      // Mock Logout Success
      callLogout() => httpClient.post(
            Uri.https(host, '/api/users/logout'),
            headers: {
              'requestverificationtoken': 'MOCK-TOKEN',
              'Cookie': validCookie,
              'Content-Type': 'application/json'
            },
          );
      when(callLogout).thenAnswer((_) => Future.value(Response('', 204)));

      // Mock save cookie
      callClearCookies() => cookieStorage.clearAll();
      when(callClearCookies).thenAnswer((_) => Future.value());

      await apiClient.logout();

      verify(callGetToken).called(1);
      verify(callLogout).called(1);
      verify(callClearCookies).called(1);
    });
    test('error when XSRF-TOKEN not exists in cookie', () async {
      const missingXSRFCookie =
          '.AspNetCore.Antiforgery.D1xlUe6EjVo=CfDJ8LqE1qELWY5OoSDCgE4RsNCvwEAeRx3JOc5-1THE8v1b-OSJd1U-VF0bcK4gyHZt-xtiVXze7sPMP-fIo93J6aht_wBGNgecYxIi1yul0S_bYmMbEWipMjqtukW1ElK4Jo8_fJRVq1hd6Zf1ccAPqgI; path=/; samesite=strict; httponly; path=/';

      // Mock Get token Success
      callGetToken() =>
          httpClient.get(Uri.https(host, '/api/antiforgery/token'));
      when(callGetToken).thenAnswer((_) => Future.value(Response(
            '',
            204,
            headers: {'set-cookie': missingXSRFCookie},
          )));

      try {
        await apiClient.logout();
        fail('exception not thrown');
      } catch (e) {
        expect(e, isA<HttpException>());
        verify(callGetToken).called(1);
        verifyNever(() => httpClient.post(any()));
        verifyNever(() => cookieStorage.clearAll());
      }
    });
  });
}
