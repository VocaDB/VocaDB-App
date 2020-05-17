import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserCookie extends Equatable {
  final List<String> cookies;

  UserCookie({@required this.cookies});

  @override
  List<Object> get props => [cookies];

  @override
  String toString() => 'UserCookie { cookies: $cookies }';
}
