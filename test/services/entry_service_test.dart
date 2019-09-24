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

    Map params = {'query': 'abc'};

    when(mockRestService.get('/api/entries', params))
        .thenAnswer((_) => Future.value(mockResult));

    service.query(params);

    expect(service.query(params), completion(isA<List<EntryModel>>()));
  });
}
