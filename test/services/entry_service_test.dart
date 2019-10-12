import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/services/entry_service.dart';
import 'package:vocadb/services/web_service.dart';

class MockRestApi extends Mock implements RestApi {}

main() {
  final mockRestApi = MockRestApi();
  final service = EntryService(restApi: mockRestApi);

  test('should return future list of entries when search', () {
    final mockResult = {
      'items': [
        {'id': 1, 'name': 'A'},
        {'id': 2, 'name': 'B'}
      ]
    };

    when(mockRestApi.get(any, any)).thenAnswer((_) => Future.value(mockResult));

    expect(service.search('abc', EntryType.Song),
        completion(isA<List<EntryModel>>()));
  });
}
