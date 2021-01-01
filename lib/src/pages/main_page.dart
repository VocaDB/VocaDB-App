import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/constants.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/routes.dart';
import 'package:vocadb_app/src/pages/menu_page.dart';
import 'package:vocadb_app/src/pages/ranking_page.dart';

/// First page with tab bottom navigation
class MainPage extends GetView<MainPageController> {
  _onTapEntrySearch() {
    Get.toNamed(Routes.SONGS);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = <Widget>[HomePage(), RankingPage(), MenuPage()];

    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: _onTapEntrySearch),
          Obx(() => (controller.tabIndex.toInt() != 1)
              ? Container()
              : IconButton(
                  icon: Icon(Icons.tune),
                  onPressed: () => Get.to(RankingFilterPage())))
        ],
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
