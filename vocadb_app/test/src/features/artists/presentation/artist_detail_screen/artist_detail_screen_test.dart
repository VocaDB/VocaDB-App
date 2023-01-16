import 'package:flutter_test/flutter_test.dart';

import '../../artist_robot.dart';

void main() {
  testWidgets('album detail screen initial success', (tester) async {
    final r = ArtistRobot(tester);
    await r.pumpArtistDetailScreen();

    await r.expectArtistDetailImageVisible();
    expect(find.text('Hatsune Miku').first, findsOneWidget);

    await r.expectAddButtonVisible();
    await r.expectShareButtonVisible();
    await r.expectInfoButtonVisible();

    await r.expectTagsVisible(true);
    await r.expectLatestSongsListVisible(true);
    await r.expectPopularSongsListVisible(true);
    await r.expectLatestAlbumsListVisible(true);
    await r.expectPopularAlbumsListVisible(true);

    await r.scrollDown();
    await r.scrollDown();
    await r.scrollDown();

    await r.expectWebLinksVisible(true);
  });
}
