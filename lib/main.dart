import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vocadb_app/bindings.dart';
import 'package:vocadb_app/config.dart';
import 'package:vocadb_app/loggers.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/services.dart';
import 'package:vocadb_app/routes.dart';
import 'package:vocadb_app/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(VocaDBApp());
}

Future<void> initServices() async {
  print('starting services ...');
  final appDirectory = AppDirectory();
  final httpService = HttpService(appDirectory: appDirectory);
  final FirebaseAnalytics analytics = FirebaseAnalytics();
  final FirebaseAnalyticsObserver analyticsObserver =
      FirebaseAnalyticsObserver(analytics: analytics);
  final AnalyticLog analyticLog =
      AnalyticLog(analytics: analytics, enable: false);

  await Get.putAsync(() => appDirectory.init());
  await Get.putAsync(() => httpService.init());
  await Get.putAsync(() =>
      AuthService(httpService: httpService, appDirectory: appDirectory)
          .checkCurrentUser());

  await GetStorage.init(SharedPreferenceService.container);
  Get.put(
      SharedPreferenceService(
          box: GetStorage(SharedPreferenceService.container))
        ..init(),
      permanent: true);

  Get.put(analyticLog);
  Get.put(analyticsObserver);

  print('All services started...');
}

class VocaDBApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: AppTranslation(),
        locale: Get.locale,
        fallbackLocale: AppTranslation.fallbackLocale,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        navigatorObservers: <NavigatorObserver>[
          Get.find<FirebaseAnalyticsObserver>()
        ],
        defaultTransition: Transition.fade,
        initialBinding: MainPageBinding(),
        initialRoute: Routes.INITIAL,
        home: MainPage(),
        getPages: AppPages.pages);
  }
}
