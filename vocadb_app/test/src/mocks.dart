import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/albums/data/album_repository.dart';
import 'package:vocadb_app/src/features/api/api_client.dart';
import 'package:vocadb_app/src/features/authentication/data/auth_repository.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';
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
