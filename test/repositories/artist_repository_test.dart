import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

import 'artist_repository_test.mocks.dart';

@GenerateMocks([HttpService])
void main() {
  final mockHttpService = MockHttpService();
  final artistRepository = ArtistRepository(httpService: mockHttpService);

  Map<String, dynamic> mockResponseSuccess;

  List<ArtistModel> expectedResultSuccess;

  setUp(() async {
    mockResponseSuccess = {
      "items": [
        {'id': 1, 'name': 'Song A'},
        {'id': 2, 'name': 'Song B'},
      ]
    };

    expectedResultSuccess = [
      ArtistModel(id: 1, name: 'Song A'),
      ArtistModel(id: 2, name: 'Song B')
    ];

    when(mockHttpService.get(any, any))
        .thenAnswer((_) => Future.value(mockResponseSuccess));
  });

  test('should return list of artist models when find artists', () async {
    expect(await artistRepository.findArtists(), expectedResultSuccess);
  });

  test('should return list of artist models when get top artists by tag id',
      () async {
    expect(
        await artistRepository.getTopArtistsByTagId(1), expectedResultSuccess);
  });
}
