import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb/blocs/youtube_playlist_bloc.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MockYoutubePlayerController extends Mock
    implements YoutubePlayerController {}

main() {
  YoutubePlaylistBloc bloc;
  MockYoutubePlayerController mockYoutubePlayerController;
  SongModel song1;
  SongModel song2;
  SongModel song3;
  SongModel song4;
  List<SongModel> mockSongs;

  setUp(() {
    mockYoutubePlayerController = MockYoutubePlayerController();
    bloc = YoutubePlaylistBloc();
    song1 = SongModel.fromJson({
      "id": 1,
      "name": "A",
      "pvs": [
        {
          "id": 1,
          "service": "Youtube",
          "url": "https://www.youtube.com/watch?v=LhzHnfdN-zA"
        }
      ]
    });
    song2 = SongModel.fromJson({
      "id": 2,
      "name": "B",
      "pvs": [
        {"id": 2, "service": "Niconico"}
      ]
    });
    song3 = SongModel.fromJson({
      "id": 3,
      "name": "C",
      "pvs": [
        {
          "id": 3,
          "service": "Youtube",
          "url": "https://www.youtube.com/watch?v=LhzHnfdN-zA"
        }
      ]
    });
    song4 = SongModel.fromJson({
      "id": 4,
      "name": "E",
      "pvs": [
        {"id": 4, "service": "SC"}
      ]
    });
    mockSongs = [song1, song2, song3, song4];
  });

  test('should emits playlist', () async {
    bloc.initialPlaylist(mockSongs, mockYoutubePlayerController);

    await expectLater(bloc.playlistStream, emits(mockSongs));
    expect(bloc.currentPV.id, 1);
  });

  test('should run next and skip unplayable PV', () async {
    bloc.initialPlaylist(mockSongs, mockYoutubePlayerController);

    await expectLater(bloc.playlistStream, emits(mockSongs));
    expect(bloc.currentPV.id, 1);

    bloc.next();

    await expectLater(bloc.currentIndexStream, emits(2));
    expect(bloc.currentPV.id, 3);
  });

  test('should run prev and skip unplayable PV', () async {
    bloc.initialPlaylist(mockSongs, mockYoutubePlayerController);

    await expectLater(bloc.playlistStream, emits(mockSongs));
    expect(bloc.currentPV.id, 1);

    bloc.next();

    await expectLater(bloc.currentIndexStream, emits(2));
    expect(bloc.currentPV.id, 3);

    bloc.prev();

    await expectLater(bloc.currentIndexStream, emits(0));
    expect(bloc.currentPV.id, 1);
  });

  test('should run select PV', () async {
    bloc.initialPlaylist(mockSongs, mockYoutubePlayerController);

    await expectLater(bloc.playlistStream, emits(mockSongs));
    expect(bloc.currentPV.id, 1);

    bloc.select(2);

    await expectLater(bloc.currentIndexStream, emits(2));
    expect(bloc.currentPV.id, 3);
  });

  test(
      'should emits first available pv when run next and no available pv not found',
      () async {
    bloc.initialPlaylist(mockSongs, mockYoutubePlayerController);

    await expectLater(bloc.playlistStream, emits(mockSongs));
    expect(bloc.currentPV.id, 1);

    bloc.select(2);

    await expectLater(bloc.currentIndexStream, emits(2));
    expect(bloc.currentPV.id, 3);

    bloc.next();

    await expectLater(bloc.currentIndexStream, emits(0));
    expect(bloc.currentPV.id, 1);
  });

  test(
      'should emits last available pv when run prev and no available pv not found',
      () async {
    List<SongModel> ms = [
      SongModel.fromJson({
        "id": 1,
        "name": "A",
        "pvs": [
          {"id": 1, "service": "Y1"}
        ]
      }),
      SongModel.fromJson({
        "id": 2,
        "name": "B",
        "pvs": [
          {"id": 2, "service": "Y2"}
        ]
      }),
      SongModel.fromJson({
        "id": 3,
        "name": "C",
        "pvs": [
          {"id": 3, "service": "Youtube"}
        ]
      }),
    ];
    bloc.initialPlaylist(ms, mockYoutubePlayerController);

    await expectLater(bloc.currentIndexStream, emits(2));
    expect(bloc.currentPV.id, 3);

    bloc.prev();

    await expectLater(bloc.currentIndexStream, emits(2));
    expect(bloc.currentPV.id, 3);
  });
}
