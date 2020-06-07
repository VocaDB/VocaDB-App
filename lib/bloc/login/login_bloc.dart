import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:vocadb/bloc/bloc.dart';
import 'package:vocadb/models/user_cookie.dart';
import 'package:vocadb/repositories/repositories.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthBloc authBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authBloc,
  })  : assert(userRepository != null),
        assert(authBloc != null);

  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final UserCookie userCookie = await userRepository.login(
          username: event.username,
          password: event.password,
        );

        authBloc.add(LoggedIn(userCookie: userCookie));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }

    if (event is SkipButtonPressed) {
      authBloc.add(SkippedLogin());
    }
  }
}
