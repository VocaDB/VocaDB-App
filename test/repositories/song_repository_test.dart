import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

import 'song_repository_test.mocks.dart';

@GenerateMocks([HttpService])
void main() {
  final mockHttpService = MockHttpService();
  final songRepository = SongRepository(httpService: mockHttpService);

  Map<String, dynamic> mockResponseSuccess;

  List<SongModel> expectedResultSuccess;

  setUp(() async {
    mockResponseSuccess = {
      "items": [
        {'id': 1, 'name': 'Song A'},
        {'id': 2, 'name': 'Song B'},
      ]
    };

    expectedResultSuccess = [
      SongModel(id: 1, name: 'Song A'),
      SongModel(id: 2, name: 'Song B')
    ];

    when(mockHttpService.get(any, any))
        .thenAnswer((_) => Future.value(mockResponseSuccess));
  });

  test('should return list of song models when find songs', () async {
    expect(await songRepository.findSongs(), expectedResultSuccess);
  });

  test('should return list of song models when get top rated', () async {
    expect(await songRepository.getTopRated(), expectedResultSuccess);
  });
}
