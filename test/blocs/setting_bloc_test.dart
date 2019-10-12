import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocadb/app_theme.dart';
import 'package:vocadb/blocs/config_bloc.dart';

class MockPreferences extends Mock implements SharedPreferences {}

main() {

  final mockPref = MockPreferences();
  test('should emits given theme', () async {
    final configBloc = ConfigBloc(mockPref);

    when(mockPref.getString('theme')).thenReturn(ThemeEnum.Dark.toString());

    configBloc.updateTheme(ThemeEnum.Light);

    await expectLater(configBloc.themeDataStream, emits(ThemeEnum.Light));
  });
}
