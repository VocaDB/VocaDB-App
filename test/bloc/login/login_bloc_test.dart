import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb/bloc/bloc.dart';
import 'package:vocadb/models/user_cookie.dart';
import 'package:vocadb/repositories/repositories.dart';

class MockUserRepository extends Mock implements UserRepository {}
class MockAuthBloc extends Mock implements AuthBloc {}
void main() {   

  LoginBloc loginBloc;
  MockAuthBloc authBloc;
  MockUserRepository userRepository;

  setUp(() {
    userRepository = MockUserRepository();
    authBloc = MockAuthBloc();
    loginBloc = LoginBloc(authBloc: authBloc, userRepository: userRepository);
  });

  tearDown(() {
    loginBloc?.close();
  });

  test('should assert if null', () {
    expect(() => LoginBloc(authBloc: null,userRepository: null), throwsA(isAssertionError));
  });
  test('initial state is correct', () {
    expect(loginBloc.initialState, LoginInitial());
  });

  test('close does not emit new states', () {
    expectLater(
      loginBloc,
      emitsInOrder([LoginInitial(), emitsDone]),
    );
    loginBloc.close();
  });

  group('Bloc test',() {
    final mockUserCookie = UserCookie(cookies: []);
    final mockException = Exception('error');
    blocTest(
      'emits [LoginLoading,LoginInitial] when Login succeeds',
      build: () async {
        when(userRepository.login(username: 'user', password: 'pass'))
        .thenAnswer((_) => Future.value(mockUserCookie));
        return loginBloc;
      },
      act: (bloc) => bloc.add(LoginButtonPressed(username: 'user', password: 'pass')),
      expect: [LoginLoading(), LoginInitial()],
      verify: (_) async {
        verify(authBloc.add(LoggedIn(userCookie: mockUserCookie))).called(1);
      }
    );

    blocTest(
      'emits [LoginLoading,LoginFailure] when Login failed',
      build: () async {
        when(userRepository.login(username: 'user', password: 'pass'))
        .thenAnswer((_) => Future.error(mockException));
        return loginBloc;
      },
      act: (bloc) => bloc.add(LoginButtonPressed(username: 'user', password: 'pass')),
      expect: [LoginLoading(), LoginFailure(error: mockException.toString())],
      verify: (_) async {
        verifyNever(authBloc.add(LoggedIn(userCookie: mockUserCookie)));
      }
    );
  });
}