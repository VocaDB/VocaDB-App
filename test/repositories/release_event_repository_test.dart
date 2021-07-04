import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

import 'release_event_repository_test.mocks.dart';

@GenerateMocks([HttpService])
void main() {
  final mockHttpService = MockHttpService();
  final releaseEventRepository =
      ReleaseEventRepository(httpService: mockHttpService);

  Map<String, dynamic> mockResponseSuccess;

  List<ReleaseEventModel> expectedResultSuccess;

  setUp(() async {
    mockResponseSuccess = {
      "items": [
        {'id': 1, 'name': 'A'},
        {'id': 2, 'name': 'B'},
      ]
    };

    expectedResultSuccess = [
      ReleaseEventModel(id: 1, name: 'A'),
      ReleaseEventModel(id: 2, name: 'B')
    ];

    when(mockHttpService.get(any, any))
        .thenAnswer((_) => Future.value(mockResponseSuccess));
  });

  test('should return list of release event models when find release events',
      () async {
    expect(await releaseEventRepository.findReleaseEvents(),
        expectedResultSuccess);
  });
}
