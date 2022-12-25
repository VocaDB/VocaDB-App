import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/authentication/domain/app_user.dart';
import 'package:vocadb_app/src/utils/in_memory_store.dart';

class AuthRepository {
  final _authState = InMemoryStore<AppUser?>(
    const AppUser(
      id: '1065',
      name: 'up2up',
    ),
  );

  Stream<AppUser?> authStateChanges() => _authState.stream;
  AppUser? get currentUser => _authState.value;

  void dispose() => _authState.close();

  Future<void> signIn(String username, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    if (currentUser == null) {
      _authState.value = const AppUser(
        id: '1065',
        name: 'up2up',
      );
    }
  }

  Future<void> signOut() async {
    await Future.delayed(const Duration(seconds: 2));
    _authState.value = null;
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final auth = AuthRepository();
  ref.onDispose(() => auth.dispose());
  return auth;
});

final authStateChangesProvider = StreamProvider.autoDispose<AppUser?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});
