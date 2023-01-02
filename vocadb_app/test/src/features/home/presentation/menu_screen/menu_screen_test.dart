import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/authentication/domain/app_user.dart';

import '../../../../mocks.dart';
import '../../menu_robot.dart';

void main() {
  testWidgets('Menu screen display correctly for logged in user',
      (tester) async {
    final r = MenuRobot(tester);
    final authRepository = MockAuthRepository();
    when(authRepository.authStateChanges)
        .thenAnswer((_) => Stream.value(const AppUser(id: '1', name: 'user')));
    await r.pumpMenuScreen(authRepository: authRepository);
    await r.expectMenuAccountVisible(true);
    await r.expectMenuLoginVisible(false);
    await r.expectMenuMySongsVisible(true);
    await r.expectMenuMyArtistsVisible(true);
    await r.expectMenuMyAlbumsVisible(true);
    await r.expectMenuSettingsVisible(true);
    await r.expectMenuContactVisible(true);
    await r.expectMenuAboutVisible(true);
  });

  testWidgets('Menu screen display correctly for guest user', (tester) async {
    final r = MenuRobot(tester);
    final authRepository = MockAuthRepository();
    when(authRepository.authStateChanges).thenAnswer((_) => Stream.value(null));
    await r.pumpMenuScreen(authRepository: authRepository);
    await r.expectMenuAccountVisible(false);
    await r.expectMenuLoginVisible(true);
    await r.expectMenuMySongsVisible(false);
    await r.expectMenuMyArtistsVisible(false);
    await r.expectMenuMyAlbumsVisible(false);
    await r.expectMenuSettingsVisible(true);
    await r.expectMenuContactVisible(true);
    await r.expectMenuAboutVisible(true);
  });
}
