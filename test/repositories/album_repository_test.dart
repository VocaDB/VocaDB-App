import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

import 'album_repository_test.mocks.dart';

@GenerateMocks([HttpService])
void main() {
  final mockHttpService = MockHttpService();
  final albumRepository = AlbumRepository(httpService: mockHttpService);

  Map<String, dynamic> mockResponseSuccess;

  List<AlbumModel> expectedResultSuccess;

  setUp(() async {
    mockResponseSuccess = {
      "items": [
        {'id': 1, 'name': 'Song A'},
        {'id': 2, 'name': 'Song B'},
      ]
    };

    expectedResultSuccess = [
      AlbumModel(id: 1, name: 'Song A'),
      AlbumModel(id: 2, name: 'Song B')
    ];

    when(mockHttpService.get(any, any))
        .thenAnswer((_) => Future.value(mockResponseSuccess));
  });

  test('should return list of album models when find albums', () async {
    expect(await albumRepository.findAlbums(), expectedResultSuccess);
  });

  test('should return list of album models when get top albums by tag id',
      () async {
    expect(await albumRepository.getTopAlbumsByTagId(1), expectedResultSuccess);
  });
}
