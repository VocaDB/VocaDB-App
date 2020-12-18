import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/src/pages/menu_page.dart';
import 'package:vocadb_app/src/pages/ranking_page.dart';

/// First page with tab bottom navigation
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> _pages = <Widget>[HomePage(), RankingPage(), MenuPage()];

  @override
  Widget build(BuildContext context) {
    final MainPageController controller = Get.put(MainPageController());

    return Scaffold(
      appBar: AppBar(
        title: Text('VocaDB'),
      ),
      body: Center(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 100),
          child: Obx(() => _pages.elementAt(controller.tabIndex.toInt())),
        ),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
              currentIndex: controller.tabIndex.toInt(),
              onTap: controller.onBottomNavTap,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.trending_up), label: 'Ranking'),
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
              ])),
    );
  }
}

class MainPageController extends GetxController {
  var tabIndex = 0.obs;
  onBottomNavTap(index) => tabIndex.value = index;
}
