import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_derived_list_view.dart';

import '../../../../mocks.dart';
import '../../song_robot.dart';

void main() {
  testWidgets('songs derived list view ...', (tester) async {
    final r = SongRobot(tester);
    final songRepository = MockSongRepository();

    when(() => songRepository.fetchSongId(any()))
        .thenAnswer((_) => Future.value(const Song(id: 1501)));

    when(() => songRepository.fetchSongsDerived(1501)).thenAnswer((_) {
      return Future.value([
        const Song(id: 1, name: 'Song_A'),
        const Song(id: 2, name: 'Song_B'),
      ]);
    });

    await r.pumpSongDerivedListView(
      songRepository: songRepository,
      songId: 1501,
    );

    verify(() => songRepository.fetchSongsDerived(1501)).called(1);

    await tester.pump();

    expect(find.byKey(SongsDerivedListView.altSongsErrorKey), findsNothing);
    expect(find.byKey(SongsDerivedListView.altSongsLoadingKey), findsNothing);
    expect(find.byKey(SongsDerivedListView.altSongsKey), findsOneWidget);
    expect(find.text('Song_A'), findsOneWidget);
  });
}
