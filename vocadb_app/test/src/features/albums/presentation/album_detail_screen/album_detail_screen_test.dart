import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_detail_screen/widgets/album_basic_info.dart';

import '../../album_robot.dart';

void main() {
  testWidgets('album detail screen initial success', (tester) async {
    final r = AlbumRobot(tester);
    await r.pumpAlbumDetailScreen();

    expect(find.widgetWithText(AlbumBasicInfo, 'synthesis'), findsOneWidget);
    expect(find.widgetWithText(AlbumBasicInfo, 'Tripshots feat. 初音ミク'),
        findsOneWidget);
    expect(find.widgetWithText(AlbumBasicInfo, 'Album • 6/11/2009'),
        findsOneWidget);

    await r.expectAlbumDetailImageVisible();

    // Buttons
    await r.expectAddButtonVisible();
    await r.expectShareButtonVisible();
    await r.expectInfoButtonVisible();

    // Rating info
    await r.expectTotalRatingVisible();
    await r.expectAverageRatingVisible();

    await r.expectTagsVisible(true);
    await r.expectArtistsVisible(true);

    await r.scrollDown();

    await r.expectTracksListVisible(true);
    await r.expectPVsVisible(true);

    await r.scrollDown();

    await r.expectWebLinksVisible(true);
  });
}
