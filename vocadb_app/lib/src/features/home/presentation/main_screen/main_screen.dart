import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/home/presentation/home_screen/home_screen.dart';
import 'package:vocadb_app/src/features/home/presentation/menu_screen/menu_screen.dart';
import 'package:vocadb_app/src/features/home/presentation/ranking_screen/ranking_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  //TODO Move to controller
  final currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VocaDB'),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.search), onPressed: () => {}),
        ],
      ),
      body: [
        const HomeScreen(),
        const RankingScreen(),
        const MenuScreen(),
      ][currentIndex],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.trending_up),
            label: 'Ranking',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
        selectedIndex: currentIndex,
        onDestinationSelected: (index) => {},
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        animationDuration: const Duration(milliseconds: 100),
      ),
    );
  }
}
