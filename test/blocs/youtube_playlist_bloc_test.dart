import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/blocs/youtube_playlist_bloc.dart';
import 'package:vocadb/models/song_model.dart';

main() {
  YoutubePlaylistBloc bloc;
  SongModel song1;
  SongModel song2;
  SongModel song3;
  List<SongModel> mockSongs;

  setUp(() {
    bloc = YoutubePlaylistBloc();
    song1 = SongModel.fromJson({
      "id": 1,
      "name": "A",
      "pvs": [
        {"id": 1, "service": "Youtube"}
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
        {"id": 3, "service": "Youtube"}
      ]
    });
    mockSongs = [song1, song2, song3];
  });

  test('should emits playlist', () async {
    bloc.updatePlaylist(mockSongs);

    await expectLater(bloc.playlistStream, emits(mockSongs));
    expect(bloc.currentPV.id, 1);
  });

  test('should run next and skip unplayable PV', () async {
    bloc.updatePlaylist(mockSongs);

    await expectLater(bloc.playlistStream, emits(mockSongs));
    expect(bloc.currentPV.id, 1);

    bloc.next();

    await expectLater(bloc.currentIndexStream, emits(2));
    expect(bloc.currentPV.id, 3);
  });

  test('should run prev and skip unplayable PV', () async {
    bloc.updatePlaylist(mockSongs);

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
    bloc.updatePlaylist(mockSongs);

    await expectLater(bloc.playlistStream, emits(mockSongs));
    expect(bloc.currentPV.id, 1);

    bloc.select(2);

    await expectLater(bloc.currentIndexStream, emits(2));
    expect(bloc.currentPV.id, 3);
  });
}
