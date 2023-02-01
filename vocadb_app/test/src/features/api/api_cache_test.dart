import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/api/api_cache.dart';

import '../../mocks.dart';

void main() {
  group('ApiCache', () {
    late ApiCache apiCahce;
    late Box box;

    setUp(() {
      box = MockBox();
      apiCahce = ApiCache(box: box);
    });

    test('Get cache non-null', () async {
      when(() => box.get(any(), defaultValue: ''))
          .thenAnswer((_) => Future.value('body1'));
      final result = await apiCahce.get('https://abc.com?q=111');
      expect(result, 'body1');
    });

    test('Put cache non-null', () async {
      when(() => box.put(any(), any())).thenAnswer((_) => Future.value());
      await apiCahce.put('https://abc.com?q=111', 'body1');
      verify(() => box.put(any(), 'body1')).called(1);
    });
  });
}
