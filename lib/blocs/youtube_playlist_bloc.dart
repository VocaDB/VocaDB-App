import 'package:rxdart/rxdart.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlaylistBloc {
  BehaviorSubject<List<SongModel>> _playlist = new BehaviorSubject.seeded([]);
  BehaviorSubject<int> _currentIndex = new BehaviorSubject.seeded(0);
  BehaviorSubject<SongModel> _currentPVDetail = new BehaviorSubject();
  BehaviorSubject<bool> _displayDetail = new BehaviorSubject.seeded(false);
  BehaviorSubject<bool> _displayLyrics = new BehaviorSubject.seeded(false);
  BehaviorSubject<PlayerState> _playerState = new BehaviorSubject();

  YoutubePlayerController youtubePlayerController;

  Observable get playlistStream => _playlist.stream;
  Observable get currentIndexStream => _currentIndex.stream;
  Observable get currentPVDetail$ => _currentPVDetail.stream;
  Observable get displayDetail$ => _displayDetail.stream;
  Observable get displayLyric$ => _displayLyrics.stream;
  Observable get playerState$ => _playerState.stream;

  List<SongModel> get songs => _playlist.value;

  SongModel get currentPV => (_playlist.value.length == 0)
      ? null
      : _playlist.value[_currentIndex.value];
  int get currentIndex => _currentIndex.value;

  YoutubePlaylistBloc(
      {List<SongModel> songs,
      YoutubePlayerController youtubePlayerController}) {
    if (songs != null && songs.isNotEmpty) {
      initialPlaylist(songs, youtubePlayerController);
    }
  }

  void initialPlaylist(
      List<SongModel> songs, YoutubePlayerController youtubePlayerController) {
    _playlist.add(songs);

    int nextPlayableIndex =
        SongList(_playlist.value).getFirstWithYoutubePVIndex(0);

    _currentIndex.add(nextPlayableIndex);

    this.youtubePlayerController = youtubePlayerController ??
        YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(
              songs[nextPlayableIndex].youtubePV.url),
          flags: YoutubePlayerFlags(
            autoPlay: false,
          ),
        );
  }

  void updateState(PlayerState playerState) {
    _playerState.add(playerState);
  }

  void onEnded() {
    this.next();
    this
        .youtubePlayerController
        .load(YoutubePlayer.convertUrlToId(currentPV.youtubePV.url));
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
    youtubePlayerController
        .load(YoutubePlayer.convertUrlToId(currentPV.youtubePV.url));
  }

  void showDetail() {
    _displayDetail.add(true);
  }

  void hideDetail() {
    _displayDetail.add(false);
  }

  void showLyric() {
    _displayLyrics.add(true);
  }

  void hideLyric() {
    _displayLyrics.add(false);
  }

  void dispose() {
    _currentIndex.close();
    _playlist.close();
    _currentPVDetail.close();
    _displayDetail.close();
    _displayLyrics.close();
    youtubePlayerController?.dispose();
  }
}
