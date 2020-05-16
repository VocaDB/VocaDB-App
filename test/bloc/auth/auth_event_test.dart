import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/bloc/bloc.dart';
import 'package:vocadb/models/user_cookie.dart';

void main() {
  group('AuthInit', () {
    test('return corrects props', () {
      expect(AuthInit().props, []);
    });
  });
  group('LoggedIn', () {
    test('return corrects props', () {
      UserCookie cookie = UserCookie(cookies: ['a', 'b']);
      expect(LoggedIn(userCookie: cookie).props, [cookie]);
    });
  });

  group('LoggedOut', () {
    test('return corrects props', () {
      expect(LoggedOut().props, []);
    });
  });
} 