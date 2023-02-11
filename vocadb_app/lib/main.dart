import 'package:hive_flutter/hive_flutter.dart';
import 'package:vocadb_app/src/app.dart';
import 'package:vocadb_app/src/features/api/api_cache.dart';
import 'package:vocadb_app/src/features/api/data/cookie_storage.dart';
import 'package:vocadb_app/src/localization/string_hardcoded.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore:depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // turn off the # in the URLs on the web
  usePathUrlStrategy();
  // * Register error handlers. For more info, see:
  // * https://docs.flutter.dev/testing/errors
  registerErrorHandlers();

  // * Storages/Cache
  final apiCacheBox = await Hive.openBox(ApiCache.key);
  final cookieBox = await Hive.openBox(CookieStorage.boxKey);

  // Clear old cached
  await apiCacheBox.clear();

  // * Entry point of the app
  runApp(
    ProviderScope(
      overrides: [
        apiCacheBoxProvider.overrideWithValue(apiCacheBox),
        cookieBoxProvider.overrideWithValue(cookieBox),
      ],
      child: const MyApp(),
    ),
  );
}

void registerErrorHandlers() {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint(details.toString());
  };
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    debugPrint(error.toString());
    return true;
  };
  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('An error occurred'.hardcoded),
      ),
      body: Center(child: Text(details.toString())),
    );
  };
}
