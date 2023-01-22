import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/constants/fake_release_event_detail.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';

import '../../../../mocks.dart';
import '../../release_event_robot.dart';

void main() {
  testWidgets('release event detail screen ...', (tester) async {
    final r = ReleaseEventRobot(tester);
    final releaseEventRepository = MockReleaseEventRepository();

    when(() => releaseEventRepository.fetchReleaseEventByID(any()))
        .thenAnswer((_) => Future.value(kFakeReleaseEventDetail));

    await r.pumpReleaseEventDetailScreen(
      releaseEventRepository: releaseEventRepository,
    );

    await tester.pump();

    await r.expectErrorMessageWidgetNotVisible();

    await r.expectAddButtonVisible();
    await r.expectShareButtonVisible();
    await r.expectInfoButtonVisible();

    await r.expectSongsListVisible(true);
    await r.expectAlbumsListVisible(true);
    await r.expectWebLinksVisible(true);
  });

  testWidgets('release event detail screen with default values',
      (tester) async {
    final r = ReleaseEventRobot(tester);
    final releaseEventRepository = MockReleaseEventRepository();

    when(() => releaseEventRepository.fetchReleaseEventByID(any())).thenAnswer(
        (_) => Future.value(ReleaseEvent(id: 1, name: 'Test-event')));

    await r.pumpReleaseEventDetailScreen(
      releaseEventRepository: releaseEventRepository,
    );

    await tester.pump();

    await r.expectErrorMessageWidgetNotVisible();

    await r.expectAddButtonVisible();
    await r.expectShareButtonVisible();
    await r.expectInfoButtonVisible();
  });
}
