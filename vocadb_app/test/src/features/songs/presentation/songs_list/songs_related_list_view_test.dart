import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/domain/song_related.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_related_list_view.dart';

import '../../../../mocks.dart';
import '../../song_robot.dart';

void main() {
  testWidgets('songs related list view ...', (tester) async {
    final r = SongRobot(tester);
    final songRepository = MockSongRepository();

    when(() => songRepository.fetchSongsRelated(any(), lang: 'Default'))
        .thenAnswer((_) {
      return Future.value(SongRelated(
        likeMatches: [
          const Song(id: 1, name: 'Song_Related_A'),
          const Song(id: 2, name: 'Song_Related_B'),
        ],
      ));
    });

    await r.pumpSongRelatedListView(
      songRepository: songRepository,
      songId: 1501,
    );

    verify(() => songRepository.fetchSongsRelated(any(), lang: 'Default'))
        .called(1);

    await tester.pump();

    expect(
        find.byKey(SongsRelatedListView.sameLikedSongsErrorKey), findsNothing);
    expect(find.byKey(SongsRelatedListView.sameLikedSongsLoadingKey),
        findsNothing);
    expect(find.byKey(SongsRelatedListView.sameLikedSongsKey), findsOneWidget);
    expect(find.text('Song_Related_A'), findsOneWidget);
  });
}
