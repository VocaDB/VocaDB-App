import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/authentication/data/auth_repository.dart';
import 'package:vocadb_app/src/features/authentication/presentation/sign_in/sign_in_state.dart';

class SignInController extends StateNotifier<SignInState> {
  SignInController({
    required this.authRepository,
  }) : super(SignInState());
  final AuthRepository authRepository;

  Future<bool> submit(String username, String password) async {
    state = state.copyWith(value: const AsyncValue.loading());
    final value =
        await AsyncValue.guard(() => _authenticate(username, password));
    state = state.copyWith(value: value);
    return value.hasError == false;
  }

  Future<void> _authenticate(String username, String password) {
    return authRepository.signIn(username, password);
  }
}

final signInControllerProvider =
    StateNotifierProvider.autoDispose<SignInController, SignInState>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return SignInController(
    authRepository: authRepository,
  );
});
