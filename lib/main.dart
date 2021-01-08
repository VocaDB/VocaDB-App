import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/bindings.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/services.dart';
import 'package:vocadb_app/routes.dart';
import 'package:vocadb_app/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(VocaDBApp());
}

void initServices() async {
  print('starting services ...');
  final appDirectory = AppDirectory();
  final httpService = HttpService(appDirectory: appDirectory);

  await Get.putAsync(() => appDirectory.init());
  await Get.putAsync(() => httpService.init());
  await Get.putAsync(() =>
      AuthService(httpService: httpService, appDirectory: appDirectory)
          .checkCurrentUser());
  print('All services started...');
}

class VocaDBApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        defaultTransition: Transition.fade,
        initialBinding: MainPageBinding(),
        initialRoute: Routes.INITIAL,
        home: LoginPage(),
        getPages: AppPages.pages);
  }
}
