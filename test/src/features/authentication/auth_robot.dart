import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/authentication/data/auth_repository.dart';
import 'package:vocadb_app/src/features/authentication/presentation/account/account_screen.dart';
import 'package:vocadb_app/src/features/authentication/presentation/sign_in/sign_in_screen.dart';

class AuthRobot {
  final WidgetTester tester;

  AuthRobot(this.tester);

  Future<void> pumpSignInScreen({AuthRepository? authRepository}) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          if (authRepository != null)
            authRepositoryProvider.overrideWithValue(authRepository)
        ],
        child: const MaterialApp(
          home: SignInScreen(),
        ),
      ),
    );
    await tester.pump();
  }

  Future<void> pumpAccountScreen({AuthRepository? authRepository}) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          if (authRepository != null)
            authRepositoryProvider.overrideWithValue(authRepository),
        ],
        child: const MaterialApp(
          home: AccountScreen(),
        ),
      ),
    );
    await tester.pump();
  }
}
