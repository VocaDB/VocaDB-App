import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

class CookieStorage {
  static const boxKey = "cookieBoxKey";
  static const cookieKey = 'cookie';

  final Box box;

  CookieStorage({
    required this.box,
  });

  Future<String> get() async {
    return box.get(cookieKey, defaultValue: "");
  }

  Future<void> save(String cookie) async {
    await box.put(cookieKey, cookie);
  }

  Future<void> clearAll() async {
    await box.clear();
  }
}

final cookieBoxProvider = Provider.autoDispose<Box>((ref) {
  throw UnimplementedError();
});

final cookieStorageProvider = Provider.autoDispose<CookieStorage>((ref) {
  final cookieBox = ref.watch(cookieBoxProvider);
  final cookieStorage = CookieStorage(box: cookieBox);

  return cookieStorage;
});
