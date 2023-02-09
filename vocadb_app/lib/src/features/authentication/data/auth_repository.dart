import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/flavor_config.dart';
import 'package:vocadb_app/src/features/authentication/data/auth_api_repository.dart';
import 'package:vocadb_app/src/features/authentication/data/auth_fake_repository.dart';
import 'package:vocadb_app/src/features/authentication/domain/app_user.dart';
import 'package:vocadb_app/src/utils/in_memory_store.dart';

abstract class AuthRepository {
  AuthRepository();

  final _authState = InMemoryStore<AppUser?>(
    const AppUser(
      id: 1065,
      name: 'up2up',
    ),
  );

  Stream<AppUser?> authStateChanges() => _authState.stream;
  AppUser? get currentUser => _authState.value;

  void dispose() => _authState.close();

  Future<void> signIn(String username, String password);

  Future<void> signOut();
}

final authRepositoryProvider = Provider.autoDispose<AuthRepository>((ref) {
  final config = ref.read(flavorConfigProvider);

  return (config.useFakeData)
      ? ref.watch(authFakeRepositoryProvider)
      : ref.watch(authApiRepositoryProvider);
});

final authStateChangesProvider = StreamProvider.autoDispose<AppUser?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});
