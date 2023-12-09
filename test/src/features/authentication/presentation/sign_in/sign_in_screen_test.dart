import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks.dart';
import '../../auth_robot.dart';

void main() {
  testWidgets('sign in screen ...', (tester) async {
    // TODO: Implement test
    final r = AuthRobot(tester);
    final authRepository = MockAuthRepository();
    await r.pumpSignInScreen(authRepository: authRepository);
  });
}
