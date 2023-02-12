import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/authentication/data/auth_repository.dart';
import 'package:vocadb_app/src/features/authentication/domain/app_user.dart';
import 'package:vocadb_app/src/utils/in_memory_store.dart';

class AuthFakeRepository implements AuthRepository {
  AuthFakeRepository();

  final _authState = InMemoryStore<AppUser?>(null);

  @override
  Stream<AppUser?> authStateChanges() => _authState.stream;
  @override
  AppUser? get currentUser => _authState.value;

  @override
  void dispose() => _authState.close();

  @override
  Future<void> signIn(String username, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    if (currentUser == null) {
      _authState.value = const AppUser(
        id: 1065,
        name: 'up2up',
      );
    }
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(const Duration(seconds: 2));
    _authState.value = null;
  }

  @override
  Future<String> getRatedSongs(int id) async {
    return 'Favorite';
  }

  @override
  Future<void> loadUserIfExists() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<AppUser> getCurrentUser() async {
    return const AppUser(id: 1065, name: 'up2up');
  }
}

final authFakeRepositoryProvider =
    Provider.autoDispose<AuthFakeRepository>((ref) {
  return AuthFakeRepository();
});
