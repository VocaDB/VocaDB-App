import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/home/presentation/home_screen/home_screen.dart';
import 'package:vocadb_app/src/features/home/presentation/menu_screen/menu_screen.dart';
import 'package:vocadb_app/src/features/home/presentation/ranking_screen/ranking_screen.dart';

class MainScreen extends StatefulWidget {
  static const tabHomeKey = Key('home-tab-key');
  static const tabRankingKey = Key('ranking-tab-key');
  static const tabMenuKey = Key('menu-tab-key');

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const HomeScreen(),
        const RankingScreen(),
        const MenuScreen(),
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            key: MainScreen.tabHomeKey,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            key: MainScreen.tabRankingKey,
            icon: Icon(Icons.trending_up),
            label: 'Ranking',
          ),
          NavigationDestination(
            key: MainScreen.tabMenuKey,
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
        selectedIndex: currentPageIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        animationDuration: const Duration(milliseconds: 100),
      ),
    );
  }
}
