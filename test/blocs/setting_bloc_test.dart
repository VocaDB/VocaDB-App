import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/app_theme.dart';
import 'package:vocadb/blocs/config_bloc.dart';

main() {
  test('should emits given theme', () async {
    final configBloc = ConfigBloc();

    configBloc.updateTheme(ThemeEnum.Light);

    await expectLater(configBloc.themeDataStream, emits(ThemeEnum.Light));
  });
}
