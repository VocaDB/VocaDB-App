import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/bindings.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/services.dart';
import 'package:vocadb_app/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(VocaDBApp());
}

void initServices() async {
  print('starting services ...');
  await Get.putAsync(() => HttpService().init());
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
      getPages: AppPages.pages,
    );
  }
}
