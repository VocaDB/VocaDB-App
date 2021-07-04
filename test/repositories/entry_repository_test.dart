import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

import 'entry_repository_test.mocks.dart';

@GenerateMocks([HttpService])
void main() {
  final mockHttpService = MockHttpService();
  final entryRepository = EntryRepository(httpService: mockHttpService);

  Map<String, dynamic> mockResponseSuccess;

  List<EntryModel> expectedResultSuccess;

  setUp(() async {
    mockResponseSuccess = {
      "items": [
        {'id': 1, 'name': 'Song A'},
        {'id': 2, 'name': 'Song B'},
      ]
    };

    expectedResultSuccess = [
      EntryModel(id: 1, name: 'Song A'),
      EntryModel(id: 2, name: 'Song B')
    ];

    when(mockHttpService.get(any, any))
        .thenAnswer((_) => Future.value(mockResponseSuccess));
  });

  test('should return list of artist models when find entries', () async {
    expect(await entryRepository.findEntries(), expectedResultSuccess);
  });
}
