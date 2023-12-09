// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

class ApiCache {
  static const key = "apiCacheKey";

  final Box box;

  ApiCache({
    required this.box,
  });

  Future<String> get(String url) async {
    return box.get(url.hashCode, defaultValue: "");
  }

  Future<void> put(String url, String body) async {
    await box.put(url.hashCode, body);
  }

  Future<void> clearAll() async {
    print('Clear all cache API');
    await box.clear();
  }
}

final apiCacheBoxProvider = Provider.autoDispose<Box>((ref) {
  throw UnimplementedError();
});

final apiCacheProvider = Provider.autoDispose<ApiCache>((ref) {
  final apiCacheBox = ref.watch(apiCacheBoxProvider);
  final apiCache = ApiCache(box: apiCacheBox);

  // Clear on initial
  ref.onDispose(() {
    apiCache.clearAll();
  });

  return apiCache;
});
