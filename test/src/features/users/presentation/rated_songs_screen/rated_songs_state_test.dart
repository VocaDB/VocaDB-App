import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:vocadb_app/src/features/users/domain/rated_songs_list_params.dart';
import 'package:vocadb_app/src/features/users/presentation/rated_songs_screen/rated_songs_state.dart';

void main() {
  group('RatedSongsListParamsState', () {
    test('updateRating', () async {
      RatedSongsListParamsState state = RatedSongsListParamsState();

      expectLater(
        state.stream,
        emitsInOrder([const RatedSongsListParams(rating: 'Like')]),
      );

      await state.updateRating('Like');
    });

    test('updateQuery', () async {
      RatedSongsListParamsState state = RatedSongsListParamsState();

      expectLater(
        state.stream,
        emitsInOrder([const RatedSongsListParams(query: 'Hatsune Miku')]),
      );

      await state.updateQuery('Hatsune Miku');
    });

    test('updateSort', () async {
      RatedSongsListParamsState state = RatedSongsListParamsState();

      expectLater(
        state.stream,
        emitsInOrder([const RatedSongsListParams(sort: 'AdditionDate')]),
      );

      await state.updateSort('AdditionDate');
    });

    test('addArtist', () async {
      RatedSongsListParamsState state = RatedSongsListParamsState();

      expectLater(
        state.stream,
        emitsInOrder([
          RatedSongsListParams(
            artistId: [1],
            artists: [Artist(id: 1, name: 'Miku')],
          )
        ]),
      );

      await state.addArtist(Artist(id: 1, name: 'Miku'));
    });

    test('addArtist without duplicated', () async {
      RatedSongsListParamsState state = RatedSongsListParamsState(
        artistId: [1],
        artists: [Artist(id: 1, name: 'Miku')],
      );

      await state.addArtist(Artist(id: 1, name: 'Miku'));
      expect(
          state.state,
          RatedSongsListParams(
            artistId: [1],
            artists: [Artist(id: 1, name: 'Miku')],
          ));
    });

    test('removeArtist to empty state', () async {
      RatedSongsListParamsState state = RatedSongsListParamsState(
        artistId: [1],
        artists: [Artist(id: 1, name: 'Miku')],
      );

      await state.removeArtist(Artist(id: 1, name: 'Miku'));
      expect(state.state, const RatedSongsListParams());
    });

    test('removeArtist when no artist in list', () async {
      RatedSongsListParamsState state = RatedSongsListParamsState();

      await state.removeArtist(Artist(id: 1, name: 'Miku'));
      expect(state.state, const RatedSongsListParams());
    });

    test('removeArtist and still have remaining', () async {
      RatedSongsListParamsState state = RatedSongsListParamsState(
        artistId: [1, 2],
        artists: [Artist(id: 1, name: 'Miku'), Artist(id: 2, name: 'Luka')],
      );

      await state.removeArtist(Artist(id: 1, name: 'Mi'));
      expect(
        state.state,
        RatedSongsListParams(
          artistId: [2],
          artists: [Artist(id: 2, name: 'Luka')],
        ),
      );
    });

    test('clearQuery', () async {
      RatedSongsListParamsState state =
          RatedSongsListParamsState(query: 'Melt');
      await state.clearQuery();
      expect(state.state, const RatedSongsListParams());
    });
  });
}
