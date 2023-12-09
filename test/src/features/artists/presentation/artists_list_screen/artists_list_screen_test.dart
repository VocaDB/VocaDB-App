import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/artists/data/constants/fake_artists_list.dart';
import 'package:vocadb_app/src/features/artists/domain/artists_list_params.dart';

import '../../../../mocks.dart';
import 'artists_list_screen_robot.dart';

void main() {
  testWidgets('artists list screen ...', (tester) async {
    registerFallbackValue(FakeArtistsListParams());

    final r = ArtistsListScreenRobot(tester);
    final artistRepository = MockArtistRepository();

    when(() => artistRepository.fetchList(
          params: any(named: 'params', that: isNotNull),
        )).thenAnswer((_) => Future.value(kFakeArtistList));

    await r.pumpArtistsListScreen(artistRepository: artistRepository);

    await r.expectArtistsDisplayCountAtLeast(3);

    expect(
        verify(() =>
                artistRepository.fetchList(params: captureAny(named: 'params')))
            .captured,
        [
          const ArtistsListParams(),
        ]);
  });
}
