import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/albums/data/constants/fake_album_collections.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_tile/album_tile.dart';
import 'package:vocadb_app/src/features/authentication/domain/app_user.dart';
import 'package:vocadb_app/src/features/users/domain/user_albums_list_params.dart';

import '../../../../mocks.dart';
import '../../user_robot.dart';

void main() {
  testWidgets('''
    When open user album screen with logged in user
    And user album collection is not empty
    Then display list of user album collection
    ''', (tester) async {
    final r = UserRobot(tester);
    final userRepository = MockUserRepository();
    final authRepository = MockAuthRepository();

    when(() => userRepository.fetchAlbums(
          1,
          const UserAlbumsListParams(lang: 'Default'),
        )).thenAnswer((_) => Future.value(kFakeAlbumCollections.toList()));

    when(() => authRepository.currentUser)
        .thenReturn(const AppUser(id: 1, name: 'up2up'));

    await r.pumpUserAlbumsListScreen(
        userRepository: userRepository, authRepository: authRepository);

    expect(find.byType(AlbumTile), findsAtLeastNWidgets(3));
  });
}
