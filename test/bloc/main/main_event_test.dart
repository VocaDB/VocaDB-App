import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/bloc/bloc.dart';

void main() {
  group('TabPressed', () {
    test('return corrects props', () {
      expect(TabPressed(index: 1).props, [1]);
    });
  });
}
