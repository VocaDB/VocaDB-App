import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/release_event_detail_bloc.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/models/release_event_model.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/services/release_event_rest_service.dart';

class MockReleaseEventService extends Mock implements ReleaseEventRestService {}

class MockConfigBloc extends Mock implements ConfigBloc {}

main() {
  MockConfigBloc mockConfigBloc = MockConfigBloc();

  final ReleaseEventModel mockSingleResult =
      ReleaseEventModel.fromJson({'id': 1, 'name': 'A'});
  final List<SongModel> mockSongs = [
    SongModel.fromJson({"id": 1, "name": "A"}),
    SongModel.fromJson({"id": 2, "name": "B"}),
  ];

  final List<AlbumModel> mockAlbums = [
    AlbumModel.fromJson({"id": 1, "name": "A"}),
    AlbumModel.fromJson({"id": 2, "name": "B"}),
  ];

  setUp(() {
    when(mockConfigBloc.contentLang).thenReturn('Default');
  });

  test('should emits result', () async {
    MockReleaseEventService mockReleaseEventService = MockReleaseEventService();

    when(mockReleaseEventService.byId(any))
        .thenAnswer((_) => Future.value(mockSingleResult));
    when(mockReleaseEventService.publishedSongs(any))
        .thenAnswer((_) => Future.value(mockSongs));
    when(mockReleaseEventService.albums(any))
        .thenAnswer((_) => Future.value(mockAlbums));

    ReleaseEventDetailBloc bloc = ReleaseEventDetailBloc(1,
        releaseEventService: mockReleaseEventService,
        configBloc: mockConfigBloc);

    await expectLater(bloc.releaseEvent$, emits(mockSingleResult));

    verify(mockReleaseEventService.byId(any)).called(1);
  });
}
