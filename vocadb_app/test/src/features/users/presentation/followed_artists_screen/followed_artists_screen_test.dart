import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/artists/data/constants/fake_followed_artist.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_tile/artist_tile.dart';
import 'package:vocadb_app/src/features/authentication/domain/app_user.dart';
import 'package:vocadb_app/src/features/users/domain/followed_artists_list_params.dart';

import '../../../../mocks.dart';
import '../../user_robot.dart';

void main() {
  testWidgets('''
    When open followed artists screen with logged in user
    And followed artists is not empty
    Then display list of followed artists 
    ''', (tester) async {
    final r = UserRobot(tester);
    final userRepository = MockUserRepository();
    final authRepository = MockAuthRepository();

    when(() => userRepository.fetchFollowedArtistsList(
          1,
          const FollowedArtistsListParams(lang: 'Default'),
        )).thenAnswer((_) => Future.value(kFakeFollowedArtistsList));

    when(() => authRepository.currentUser)
        .thenReturn(const AppUser(id: '1', name: 'up2up'));

    await r.pumpFollowedArtistsScreen(
        userRepository: userRepository, authRepository: authRepository);

    expect(find.byType(ArtistTile), findsAtLeastNWidgets(3));
  });
}
