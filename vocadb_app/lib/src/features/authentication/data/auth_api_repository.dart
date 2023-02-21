import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/albums/domain/album_collection.dart';
import 'package:vocadb_app/src/features/api/api_client.dart';
import 'package:vocadb_app/src/features/authentication/data/auth_repository.dart';
import 'package:vocadb_app/src/features/authentication/domain/app_user.dart';
import 'package:vocadb_app/src/utils/in_memory_store.dart';

class AuthApiRepository implements AuthRepository {
  final ApiClient apiClient;

  AuthApiRepository({required this.apiClient, AppUser? appUser});

  final _authState = InMemoryStore<AppUser?>(null);

  @override
  Stream<AppUser?> authStateChanges() => _authState.stream;

  @override
  AppUser? get currentUser => _authState.value;

  @override
  void dispose() => _authState.close();

  /// Login by using token from `/api/antiforgery/token`
  /// And then get current user to check if cookie is valid
  /// Then add current user into _authState.value
  @override
  Future<void> signIn(String username, String password) async {
    await apiClient.login(username, password);
    final appUser = await getCurrentUser();
    _authState.value = appUser;
  }

  @override
  Future<void> signOut() async {
    await apiClient.logout();
    _authState.value = null;
  }

  @override
  Future<String> getRatedSongs(int id) async {
    return await apiClient.authGet(
      '/api/users/current/ratedSongs/$id',
    );
  }

  @override
  Future<void> loadUserIfExists() async {
    try {
      print('Check current user if exists...');
      final value = await getCurrentUser();
      _authState.value = value;
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<AppUser> getCurrentUser() async {
    final response = await apiClient.authGet(
      '/api/users/current',
      params: {'fields': 'MainPicture'},
    );

    return AppUser.fromJson(response);
  }

  @override
  Future<AlbumCollection> getAlbumCollection(int id) async {
    final response = await apiClient
        .authGet('/api/users/current/album-collection-statuses/$id');

    return AlbumCollection.fromJson(response);
  }
}

final authApiRepositoryProvider =
    Provider.autoDispose<AuthApiRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final auth = AuthApiRepository(apiClient: apiClient);
  ref.onDispose(() => auth.dispose());
  return auth;
});
