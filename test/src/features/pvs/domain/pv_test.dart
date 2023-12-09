import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/pvs/domain/pv.dart';

void main() {
  group('pv', () {
    test('parse json with all data', () {
      const raw = '''
      {
        "id": 1,
        "name": "pv_name",
        "service": "youtube",
        "pvType": "Other",
        "url": "test_url"
      }
      ''';
      final json = jsonDecode(raw);
      final expected = PV(
        id: 1,
        name: 'pv_name',
        service: 'youtube',
        pvType: 'Other',
        url: 'test_url',
      );

      expect(PV.fromJson(json), expected);
    });
  });
}
