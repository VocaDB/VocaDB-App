import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/authentication/domain/app_user.dart';

import '../../../../mocks.dart';
import '../../auth_robot.dart';

void main() {
  testWidgets('account screen ...', (tester) async {
    // TODO: Implement test
    final r = AuthRobot(tester);
    final authRepository = MockAuthRepository();
    when(authRepository.authStateChanges)
        .thenAnswer((_) => Stream.value(const AppUser(id: 1, name: 'user')));
    await r.pumpAccountScreen(authRepository: authRepository);
  });
}
