import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/albums/data/album_repository.dart';
import 'package:vocadb_app/src/features/api/api_cache.dart';
import 'package:vocadb_app/src/features/api/api_client.dart';
import 'package:vocadb_app/src/features/api/data/cookie_storage.dart';
import 'package:vocadb_app/src/features/artists/data/artist_repository.dart';
import 'package:vocadb_app/src/features/artists/domain/artists_list_params.dart';
import 'package:vocadb_app/src/features/authentication/data/auth_repository.dart';
import 'package:vocadb_app/src/features/entries/data/entry_repository.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/release_event_repository.dart';
import 'package:vocadb_app/src/features/settings/data/user_settings_repository.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';
import 'package:vocadb_app/src/features/tags/data/tag_repository.dart';
import 'package:vocadb_app/src/features/users/data/user_repository.dart';
import 'package:vocadb_app/src/features/users/domain/rated_songs_list_params.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockClient extends Mock implements Client {}

class MockApiClient extends Mock implements ApiClient {}

class FakeUri extends Fake implements Uri {}

class MockSongRepository extends Mock implements SongRepository {}

class MockAlbumRepository extends Mock implements AlbumRepository {}

class MockUserRepository extends Mock implements UserRepository {}

class RatedSongsListParamsFake extends Fake implements RatedSongsListParams {}

class FakeArtistsListParams extends Fake implements ArtistsListParams {}

class MockUserSettingsRepository extends Mock
    implements UserSettingsRepository {}

class MockArtistRepository extends Mock implements ArtistRepository {}

class MockTagRepository extends Mock implements TagRepository {}

class MockReleaseEventRepository extends Mock
    implements ReleaseEventRepository {}

class MockEntryRepository extends Mock implements EntryRepository {}

class MockBox extends Mock implements Box {}

class MockApiCache extends Mock implements ApiCache {}

class MockCookieStorage extends Mock implements CookieStorage {}
