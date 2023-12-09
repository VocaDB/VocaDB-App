import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vocadb_app/src/features/settings/presentation/settings_screen/setting_screen.dart';

class SettingsRobot {
  final WidgetTester tester;

  SettingsRobot(this.tester);

  Future<void> pumpSettingsScreen() async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: SettingScreen(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );
    await tester.pump();
  }
}
