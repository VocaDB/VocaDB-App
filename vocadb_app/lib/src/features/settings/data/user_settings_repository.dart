import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/utils/in_memory_store.dart';

class UserSettingsRepository {
  final _interfaceLangState = InMemoryStore<String>('en');
  final _preferredLangState = InMemoryStore<String>('Default');

  Stream<String> interfaceLangStateChanges() => _interfaceLangState.stream;
  String get currentInterfaceLang => _interfaceLangState.value;

  Stream<String> preferredLangStateChanges() {
    final s = _preferredLangState.stream;
    return s;
  }

  String get currentPreferredLang => _preferredLangState.value;

  Future<void> saveInterfaceLang(String interfaceLang) async {
    _interfaceLangState.value = interfaceLang;
  }

  Future<void> savePreferredLang(String preferredDisplayLang) async {
    _preferredLangState.value = preferredDisplayLang;
  }

  void dispose() {
    _interfaceLangState.close();
    _preferredLangState.close();
  }
}

/// Declare repository provider
final userSettingsRepositoryProvider = Provider<UserSettingsRepository>((ref) {
  final userSettingsRepository = UserSettingsRepository();
  // ref.onDispose(() => userSettingsRepository.dispose());
  return userSettingsRepository;
});

final interfaceLangStateChangesProvider = StreamProvider<String?>((ref) async* {
  final repository = ref.watch(userSettingsRepositoryProvider);
  yield* repository.interfaceLangStateChanges();
});

final preferredStateChangesProvider = StreamProvider<String>((ref) async* {
  final repository = ref.watch(userSettingsRepositoryProvider);
  yield* repository.preferredLangStateChanges();
});
