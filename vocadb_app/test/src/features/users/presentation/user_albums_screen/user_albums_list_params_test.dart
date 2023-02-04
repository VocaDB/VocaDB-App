import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/users/domain/user_albums_list_params.dart';
import 'package:vocadb_app/src/features/users/presentation/user_albums_screen/user_albums_list_params_state.dart';

void main() {
  group('UserAlbumsListParamsState', () {
    late UserAlbumsListParamsState state;

    setUp(() {
      state = UserAlbumsListParamsState();
    });
    test('updateAlbumType', () async {
      expectLater(
        state.stream,
        emitsInOrder([const UserAlbumsListParams(albumTypes: 'Original')]),
      );

      await state.updateAlbumTypes('Original');
    });

    test('updatePurchaseStatuses', () async {
      expectLater(
        state.stream,
        emitsInOrder([const UserAlbumsListParams(purchaseStatuses: 'Owned')]),
      );

      await state.updatePurchaseStatuses('Owned');
    });

    test('updateQuery', () async {
      expectLater(
        state.stream,
        emitsInOrder([const UserAlbumsListParams(query: 'Hatsune Miku')]),
      );

      await state.updateQuery('Hatsune Miku');
    });

    test('updateSort', () async {
      expectLater(
        state.stream,
        emitsInOrder([const UserAlbumsListParams(sort: 'AdditionDate')]),
      );

      await state.updateSort('AdditionDate');
    });

    test('clearQuery', () async {
      state = UserAlbumsListParamsState(query: 'Melt');
      await state.clearQuery();
      expect(state.state, const UserAlbumsListParams());
    });
  });
}
