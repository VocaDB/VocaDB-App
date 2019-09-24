import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/services/entry_service.dart';
import 'package:vocadb/services/web_service.dart';

class MockRestService extends Mock implements RestService {}

main() {

  final mockRestService = MockRestService();
  final service = EntryService(mockRestService);

  test('should return future list of entries', () {
    final mockResult = {
      'items': [
        {'id': 1, 'name': 'A'},
        {'id': 2, 'name': 'B'}
      ]
    };

    when(mockRestService.get('/api/entries', {'query': 'abc'}))
        .thenAnswer((_) => Future.value(mockResult));

    service.query('abc', EntryType.Song);

    expect(service.query('abc', EntryType.Song), completion(isA<List<EntryModel>>()));
  });
}
