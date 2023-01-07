import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/songs/data/constants/duration_hours.dart';

import '../../../../mocks.dart';
import 'ranking_robot.dart';

void main() {
  testWidgets('ranking screen ...', (tester) async {
    final r = RankingRobot(tester);
    final songRepository = MockSongRepository();

    await r.pumpRankingScreen(songRepository: songRepository);

    await r.tapWeekly();
    await r.tapMonthly();
    await r.tapDaily();
    await r.tapOverall();

    verify(() => songRepository.fetchSongsTopRated(
        durationHours: DurationHours.daily.value)).called(2);
    verify(() => songRepository.fetchSongsTopRated(
        durationHours: DurationHours.weekly.value)).called(1);
    verify(() => songRepository.fetchSongsTopRated(
        durationHours: DurationHours.monthly.value)).called(1);
    verify(songRepository.fetchSongsTopRated).called(1);
  });
}
