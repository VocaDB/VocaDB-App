import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/blocs/lyric_content_bloc.dart';
import 'package:vocadb/models/lyric_model.dart';

main() {

  final lyric1 = LyricModel.fromJson({ 'id':1, 'translationType': 'Original', 'value': 'A'});
  final lyric2 = LyricModel.fromJson({ 'id':2, 'translationType': 'Translate', 'value': 'B'});

  final List<LyricModel> mockLyrics = [
    lyric1, lyric2,
  ];
  test('should emits selected lyric', () async {
    final bloc = LyricContentBloc(mockLyrics);
    
    await expectLater(bloc.selectedLyric$, emits(lyric1));

    bloc.changeTranslation('Translate');

    await expectLater(bloc.selectedLyric$, emits(lyric2));
  });
}