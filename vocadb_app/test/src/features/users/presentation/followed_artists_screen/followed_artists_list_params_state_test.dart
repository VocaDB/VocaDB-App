import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/users/domain/followed_artists_list_params.dart';
import 'package:vocadb_app/src/features/users/presentation/followed_artists_screen/followed_artists_list_params_state.dart';

void main() {
  group('FollowedArtistsListParamsState', () {
    late FollowedArtistsListParamsState state;

    setUp(() {
      state = FollowedArtistsListParamsState();
    });
    test('updateArtistType', () async {
      expectLater(
        state.stream,
        emitsInOrder([const FollowedArtistsListParams(artistType: 'Vocaloid')]),
      );

      await state.updateArtistType('Vocaloid');
    });

    test('updateQuery', () async {
      expectLater(
        state.stream,
        emitsInOrder([const FollowedArtistsListParams(query: 'Hatsune Miku')]),
      );

      await state.updateQuery('Hatsune Miku');
    });

    test('updateSort', () async {
      expectLater(
        state.stream,
        emitsInOrder([const FollowedArtistsListParams(sort: 'AdditionDate')]),
      );

      await state.updateSort('AdditionDate');
    });

    test('clearQuery', () async {
      state = FollowedArtistsListParamsState(query: 'Melt');
      await state.clearQuery();
      expect(state.state, const FollowedArtistsListParams());
    });
  });
}
