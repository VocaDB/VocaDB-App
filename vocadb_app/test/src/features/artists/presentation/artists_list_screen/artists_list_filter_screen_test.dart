import 'package:flutter_test/flutter_test.dart';

import 'artists_list_filter_screen_robot.dart';

void main() {
  group('artists filter screen', () {
    testWidgets('change artist type', (tester) async {
      String? selectedValue;
      final r = ArtistsListFilterScreenRobot(tester);

      await r.pumpArtistsListFilterScreen(
        onArtistTypesChanged: (value) => selectedValue = value,
      );

      await r.selectArtistTypes('UTAU');
      expect(selectedValue, 'UTAU');
    });

    testWidgets('change sort', (tester) async {
      String? selectedValue;
      final r = ArtistsListFilterScreenRobot(tester);

      await r.pumpArtistsListFilterScreen(
        onArtistTypesChanged: (value) => selectedValue = value,
      );

      await r.selectSort('Addition date (descending)');
      expect(selectedValue, 'AdditionDate');
    });
  });
}
