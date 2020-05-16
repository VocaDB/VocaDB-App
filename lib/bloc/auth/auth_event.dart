import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:vocadb/models/user_cookie.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthInit extends AuthEvent {
  @override
  List<Object> get props => [];
}

class LoggedIn extends AuthEvent {
  final UserCookie userCookie;

  const LoggedIn({@required this.userCookie});

  @override
  List<Object> get props => [userCookie];

  @override
  String toString() => 'LoggedIn { userCookie: $userCookie }';
}

class LoggedOut extends AuthEvent {
  @override
  List<Object> get props => [];
}
