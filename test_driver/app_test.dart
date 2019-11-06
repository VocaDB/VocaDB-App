import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:vocadb/constants.dart';

void main() {
  group('Test app', () {
    final appNameFinder = find.byValueKey('app_name');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Test initial app', () async {
      await sleep(Duration(seconds: 5));
      
      expect(await driver.getText(appNameFinder), APP_NAME);
      expect(await driver.getText(find.byValueKey('tab_home')), 'Home');
      expect(await driver.getText(find.byValueKey('tab_ranking')), 'Ranking');
      expect(await driver.getText(find.byValueKey('tab_menu')), 'Menu');
    });
  });
}