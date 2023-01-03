import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/api/api_client.dart';
import 'package:vocadb_app/src/features/authentication/data/auth_repository.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockClient extends Mock implements Client {}

class MockApiClient extends Mock implements ApiClient {}

class FakeUri extends Fake implements Uri {}

class MockSongRepository extends Mock implements SongRepository {}
