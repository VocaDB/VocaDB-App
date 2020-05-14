import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb/models/user_cookie.dart';
import 'package:vocadb/models/user_model.dart';
import 'package:vocadb/repositories/repositories.dart';

class MockApiClient extends Mock implements VocaDBApiClient {}

void main() {
  group('assertion', () {
    test('should assert if null', () {
      expect(
        () => UserRepository(apiClient: null),
        throwsA(isAssertionError),
      );
    });
  });

  group('login', () {
    final mockApiClient = MockApiClient();
    final mockUserRepository = UserRepository(apiClient: mockApiClient);

    test('should return user cookie', () async {
      final UserCookie mockUserCookie = UserCookie();

      when(mockApiClient.login(any, any))
          .thenAnswer((_) => Future.value(mockUserCookie));

      expect(await mockUserRepository.login(username: 'user', password: 'pass'),
          mockUserCookie);
    });
  });

  group('getCurrent', () {
    final mockApiClient = MockApiClient();
    final mockUserRepository = UserRepository(apiClient: mockApiClient);

    test('should return current user', () async {
      UserModel mockUser = UserModel.fromJson({"id": 1, "name": "up2up"});

      when(mockApiClient.get(any, any))
          .thenAnswer((_) => Future.value({"id": 1, "name": "up2up"}));

      expect(await mockUserRepository.getCurrent(), mockUser);
    });

    test('should return null when get current user and got 404', () async {
      when(mockApiClient.get(any, any)).thenAnswer(
          (_) => Future.error(DioError(response: Response(statusCode: 404))));

      expect(await mockUserRepository.getCurrent(), isNull);
    });

    test('should return exception when get current user with other error',
        () async {
      when(mockApiClient.get(any, any)).thenAnswer(
          (_) => Future.error(DioError(response: Response(statusCode: 500))));

      expect(() async => await mockUserRepository.getCurrent(),
          throwsA(TypeMatcher<DioError>()));
    });
  });
}
