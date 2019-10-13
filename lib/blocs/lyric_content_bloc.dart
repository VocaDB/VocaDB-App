import 'package:rxdart/rxdart.dart';
import 'package:vocadb/models/lyric_model.dart';

class LyricContentBloc {
  // <translationType, lyric>
  final List<LyricModel> lyrics;

  Map<String, LyricModel> mapLyrics = {};

  final _selectedLyric = BehaviorSubject<LyricModel>();

  Observable get selectedLyric$ => _selectedLyric.stream;

  LyricContentBloc(this.lyrics) {
    print('show lyrics');
    print(this.lyrics);
    initMapTranslationLyric();
  }

  void initMapTranslationLyric() {
    if (mapLyrics.isNotEmpty) {
      return;
    }

    mapLyrics.clear();

    lyrics.forEach((LyricModel l) {
      mapLyrics.putIfAbsent(l.translationType, () => l);
    });

    _selectedLyric.add(lyrics[0]);
  }

  void changeTranslation(String translationType) {
    _selectedLyric.add(mapLyrics[translationType]);
  }

  void dispose() {
    _selectedLyric?.close();
  }
}
