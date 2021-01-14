import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/services.dart';
import 'package:vocadb_app/utils.dart';

class MockHttpService extends Mock implements HttpService {}

class MockAppDirectory extends Mock implements AppDirectory {}

void main() {
  group('assertion', () {
    test('should assert if null', () {
      expect(
        () => AuthService(httpService: null),
        throwsA(isAssertionError),
      );
    });
  });

  group('login', () {
    final mockHttpService = MockHttpService();
    final mockAppDirectory = MockAppDirectory();
    final mockAuthService = AuthService(
        httpService: mockHttpService, appDirectory: mockAppDirectory);

    test('should return user cookie', () async {
      final UserCookie mockUserCookie = UserCookie(cookies: []);

      when(mockHttpService.login(any, any))
          .thenAnswer((_) => Future.value(mockUserCookie));

      expect(await mockAuthService.login(username: 'user', password: 'pass'),
          mockUserCookie);
    });
  });

  group('getCurrent', () {
    final mockHttpService = MockHttpService();
    final mockAppDirectory = MockAppDirectory();
    final mockAuthService = AuthService(
        httpService: mockHttpService, appDirectory: mockAppDirectory);

    test('should return current user', () async {
      UserModel mockUser = UserModel.fromJson({"id": 1, "name": "up2up"});

      when(mockHttpService.get(any, any))
          .thenAnswer((_) => Future.value({"id": 1, "name": "up2up"}));

      expect(await mockAuthService.getCurrent(), mockUser);
    });

    test('should return null when get current user and got 404', () async {
      when(mockHttpService.get(any, any)).thenAnswer(
          (_) => Future.error(DioError(response: Response(statusCode: 404))));

      expect(await mockAuthService.getCurrent(), isNull);
    });

    test('should return exception when get current user with other error',
        () async {
      when(mockHttpService.get(any, any)).thenAnswer(
          (_) => Future.error(DioError(response: Response(statusCode: 500))));

      expect(() async => await mockAuthService.getCurrent(),
          throwsA(TypeMatcher<DioError>()));
    });
  });
}
