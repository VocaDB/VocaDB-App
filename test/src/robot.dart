import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/app.dart';
import 'package:vocadb_app/src/features/albums/data/album_repository.dart';
import 'package:vocadb_app/src/features/artists/data/artist_repository.dart';
import 'package:vocadb_app/src/features/authentication/data/auth_repository.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/release_event_repository.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';

class Robot {
  final WidgetTester tester;

  const Robot(this.tester);

  Future<void> pumpMyApp({
    SongRepository? songRepository,
    ArtistRepository? artistRepository,
    AlbumRepository? albumRepository,
    ReleaseEventRepository? releaseEventRepository,
    AuthRepository? authRepository,
  }) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          if (songRepository != null)
            songRepositoryProvider.overrideWithValue(songRepository),
          if (artistRepository != null)
            artistRepositoryProvider.overrideWithValue(artistRepository),
          if (albumRepository != null)
            albumRepositoryProvider.overrideWithValue(albumRepository),
          if (releaseEventRepository != null)
            releaseEventRepositoryProvider
                .overrideWithValue(releaseEventRepository),
          if (authRepository != null)
            authRepositoryProvider.overrideWithValue(authRepository),
        ],
        child: const MyApp(),
      ),
    );
  }
}
