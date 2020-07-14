import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb/bloc/bloc.dart';
import 'package:vocadb/models/user_cookie.dart';
import 'package:vocadb/models/user_model.dart';
import 'package:vocadb/repositories/repositories.dart';
import 'package:vocadb/utils/app_directory.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockAppDirectory extends Mock implements AppDirectory {}

void main() {
  AuthBloc authBloc;
  MockUserRepository userRepository;
  MockAppDirectory appDirectory;

  setUp(() {
    userRepository = MockUserRepository();
    appDirectory = MockAppDirectory();
    authBloc =
        AuthBloc(userRepository: userRepository, appDirectory: appDirectory);
  });

  tearDown(() {
    authBloc?.close();
  });

  test('should assert if null', () {
    expect(() => AuthBloc(userRepository: null, appDirectory: null),
        throwsA(isAssertionError));
  });
  test('initial state is correct', () {
    expect(authBloc.initialState, AuthUninitialized());
  });

  test('close does not emit new states', () {
    expectLater(
      authBloc,
      emitsInOrder([AuthUninitialized(), emitsDone]),
    );
    authBloc.close();
  });

  group('Bloc test', () {
    final mockUser = UserModel.fromJson({'id': 1, 'name': 'a'});
    blocTest(
        'emits [AuthAuthenticated] when AuthInit and get current user is not null',
        build: () async {
          when(userRepository.getCurrent())
              .thenAnswer((_) => Future.value(mockUser));
          return authBloc;
        },
        act: (bloc) => bloc.add(AuthInit()),
        expect: [AuthAuthenticated(user: mockUser)]);
    blocTest(
        'emits [AuthUnauthenticated] when AuthInit and get current user is null',
        build: () async {
          when(userRepository.getCurrent())
              .thenAnswer((_) => Future.value(null));
          return authBloc;
        },
        act: (bloc) => bloc.add(AuthInit()),
        expect: [AuthUnauthenticated()]);
    blocTest(
        'emits [AuthError, AuthUnauthenticated] when AuthInit and get current user is return exception',
        build: () async {
          when(userRepository.getCurrent())
              .thenAnswer((_) => Future.error(null));
          return authBloc;
        },
        act: (bloc) => bloc.add(AuthInit()),
        expect: [AuthError(), AuthUnauthenticated()]);
    blocTest('emits [AuthAuthenticated] when LoggedIn',
        build: () async {
          when(userRepository.getCurrent())
              .thenAnswer((_) => Future.value(mockUser));
          return authBloc;
        },
        act: (bloc) =>
            bloc.add(LoggedIn(userCookie: UserCookie(cookies: ['A']))),
        expect: [AuthAuthenticated(user: mockUser)]);

    blocTest('emits [AuthUnauthenticated] when LoggedOut',
        build: () async {
          return authBloc;
        },
        act: (bloc) => bloc.add(LoggedOut()),
        expect: [AuthUnauthenticated()]);

    blocTest('emits [GuestAuthenticated] when SkippedLogin',
        build: () async {
          return authBloc;
        },
        act: (bloc) => bloc.add(SkippedLogin()),
        expect: [GuestAuthenticated()]);
  });
}
