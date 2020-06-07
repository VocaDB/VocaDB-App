import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:vocadb/models/user_model.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class AuthUninitialized extends AuthState {}

class AuthAuthenticated extends AuthState {
  final UserModel user;

  const AuthAuthenticated({@required this.user});

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'AuthAuthenticated { user: $user }';
}

class GuestAuthenticated extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthUnauthenticated extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {}
