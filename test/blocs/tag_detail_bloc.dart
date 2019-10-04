import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb/blocs/tag_detail_bloc.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/models/artist_model.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/services/album_rest_service.dart';
import 'package:vocadb/services/artist_rest_service.dart';
import 'package:vocadb/services/song_rest_service.dart';
import 'package:vocadb/services/tag_rest_service.dart';

class MockTagService extends Mock implements TagRestService {}

class MockSongService extends Mock implements SongRestService {}

class MockAlbumService extends Mock implements AlbumRestService {}

class MockArtistService extends Mock implements ArtistRestService {}

class MockConfigBloc extends Mock implements ConfigBloc {}

main() {
  MockConfigBloc mockConfigBloc = MockConfigBloc();
  MockSongService mockSongService = MockSongService();
  MockArtistService mockArtistService = MockArtistService();
  MockAlbumService mockAlbumService = MockAlbumService();

  final TagModel mockSingleResult = TagModel.fromJson({'id': 1, 'name': 'A'});
  final List<SongModel> mockSongs = [
    SongModel.fromJson({'id': 1, 'name': 'A'}),
    SongModel.fromJson({'id': 2, 'name': 'B'})
  ];

  final List<AlbumModel> mockAlbums = [
    AlbumModel.fromJson({'id': 1, 'name': 'A'}),
    AlbumModel.fromJson({'id': 2, 'name': 'B'})
  ];

  final List<ArtistModel> mockArtists = [
    ArtistModel.fromJson({'id': 1, 'name': 'A'}),
    ArtistModel.fromJson({'id': 2, 'name': 'B'})
  ];

  setUp(() {
    when(mockConfigBloc.contentLang).thenReturn('Default');
  });

  test('should emits result', () async {
    MockTagService mockTagService = MockTagService();

    when(mockTagService.byId(any))
        .thenAnswer((_) => Future.value(mockSingleResult));
    when(mockSongService.latestByTagId(any))
        .thenAnswer((_) => Future.value(mockSongs));
    when(mockSongService.topByTagId(any))
        .thenAnswer((_) => Future.value(mockSongs));
    when(mockArtistService.topByTagId(any))
        .thenAnswer((_) => Future.value(mockArtists));
    when(mockAlbumService.topByTagId(any))
        .thenAnswer((_) => Future.value(mockAlbums));

    TagDetailBloc bloc = TagDetailBloc(1,
        tagService: mockTagService,
        configBloc: mockConfigBloc,
        songService: mockSongService,
        artistService: mockArtistService,
        albumService: mockAlbumService);

    await expectLater(bloc.tag$, emits(mockSingleResult));
    await expectLater(bloc.latestSongs$, emits(mockSongs));
    await expectLater(bloc.topSongs$, emits(mockSongs));
    await expectLater(bloc.topAlbums$, emits(mockAlbums));
    await expectLater(bloc.topArtists$, emits(mockArtists));

    verify(mockTagService.byId(any)).called(1);
  });
}
