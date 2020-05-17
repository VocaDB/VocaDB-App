import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/bloc/bloc.dart';

void main() {
  group('LoginButtonPressed', () {
    test('return corrects props', () {
      expect(LoginButtonPressed(username: 'user', password: 'pass').props, ['user', 'pass']);
    });
  });
} 