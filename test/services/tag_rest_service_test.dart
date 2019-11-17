import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/services/tag_rest_service.dart';
import 'package:vocadb/services/web_service.dart';

class MockRestService extends Mock implements RestApi {}

main() {
  final mockApi = MockRestService();
  final service = TagRestService(restApi: mockApi);

  test('should return tags list', () {
    final mockResults = {
      'items': [
        {'id': 1, 'name': 'A'},
        {'id': 2, 'name': 'B'}
      ]
    };

    when(mockApi.get(any, any)).thenAnswer((_) => Future.value(mockResults));

    expect(service.search('rock'), completion(isA<List<TagModel>>()));
  });

  test('should return tag detail', () {
    when(mockApi.get(any, any))
        .thenAnswer((_) => Future.value({'id': 1, 'name': 'A'}));

    expect(service.byId(1), completion(isA<TagModel>()));
  });

  test('shoud return tag categories', () {
    when(mockApi.get(any, any))
        .thenAnswer((_) => Future.value(['Theme', 'Language', 'Game']));

    expect(service.categoryNames(), completion(isA<List<String>>()));
  });
}
