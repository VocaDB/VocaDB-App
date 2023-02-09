import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/api/data/cookie_storage.dart';

import '../../../mocks.dart';

void main() {
  group('cookieStorage', () {
    late CookieStorage cookieStorage;
    late Box box;

    setUp(() {
      box = MockBox();
      cookieStorage = CookieStorage(box: box);
    });

    test('Get non-null cookie', () async {
      when(() => box.get(CookieStorage.cookieKey, defaultValue: ''))
          .thenAnswer((_) => 'cookieValue');

      final result = await cookieStorage.get();
      expect(result, 'cookieValue');
    });

    test('Save cookie', () async {
      when(() => box.put(any(), any())).thenAnswer((_) => Future.value());
      await cookieStorage.save('cookieValue');
      verify(() => box.put(any(), 'cookieValue')).called(1);
    });
  });
}
