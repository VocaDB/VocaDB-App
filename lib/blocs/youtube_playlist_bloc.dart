import 'package:rxdart/rxdart.dart';
import 'package:vocadb/models/song_model.dart';

class YoutubePlaylistBloc {
  BehaviorSubject<List<SongModel>> _playlist = new BehaviorSubject.seeded([]);
  BehaviorSubject<int> _currentIndex = new BehaviorSubject.seeded(0);

  Observable get playlistStream => _playlist.stream;
  Observable get currentIndexStream => _currentIndex.stream;

  SongModel get currentPV => (_playlist.value.length == 0)
      ? null
      : _playlist.value[_currentIndex.value];
  int get currentIndex => _currentIndex.value;

  void updatePlaylist(List<SongModel> songs) {
    _playlist.add(songs);

    int nextPlayableIndex =
        SongList(_playlist.value).getFirstWithYoutubePVIndex(0);

    _currentIndex.add(nextPlayableIndex);
  }

  void next() {
    int newIndex = _currentIndex.value + 1;

    if (newIndex >= _playlist.value.length) {
      newIndex = 0;
    }

    int nextPlayableIndex =
        SongList(_playlist.value).getFirstWithYoutubePVIndex(newIndex);

    if (nextPlayableIndex == -1) {
      nextPlayableIndex =
          SongList(_playlist.value).getFirstWithYoutubePVIndex(0);
    }

    _currentIndex.add(nextPlayableIndex);
  }

  void prev() {
    int newIndex = _currentIndex.value - 1;

    if (newIndex < 0) {
      newIndex = _playlist.value.length - 1;
    }

    int lastPlayableIndex =
        SongList(_playlist.value).getLastWithYoutubePVIndex(newIndex);

    if (lastPlayableIndex == -1) {
      lastPlayableIndex = SongList(_playlist.value)
          .getLastWithYoutubePVIndex(_playlist.value.length - 1);
    }

    _currentIndex.add(lastPlayableIndex);
  }

  void select(int index) {
    _currentIndex.add(index);
  }

  void dispose() {
    _currentIndex.close();
    _playlist.close();
  }
}
