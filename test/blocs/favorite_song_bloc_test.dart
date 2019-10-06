import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/blocs/favorite_song_bloc.dart';
import 'package:vocadb/models/song_model.dart';

main() {
  test('should add and remove song', () async {
    final song = SongModel.fromJson({'id': 1, 'name': 'A'});

    final bloc = FavoriteSongBloc();

    expect(bloc.songs, isNull);

    bloc.add(song);

    final expected = {1: song};

    await expectLater(bloc.songs$, emits(expected));

    expect(bloc.songs, isNotNull);

    bloc.remove(1);

    await expectLater(bloc.songs$, emits({}));
  });
}
