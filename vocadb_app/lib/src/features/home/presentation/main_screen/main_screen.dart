import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/home/presentation/home_screen/home_screen.dart';
import 'package:vocadb_app/src/features/home/presentation/main_screen/main_screen_controller.dart';
import 'package:vocadb_app/src/features/home/presentation/menu_screen/menu_screen.dart';
import 'package:vocadb_app/src/features/home/presentation/ranking_screen/ranking_screen.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  static const tabHomeKey = Key('home-tab-key');
  static const tabRankingKey = Key('ranking-tab-key');
  static const tabMenuKey = Key('menu-tab-key');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(mainScreenTabIndexStateProvider);
    return Scaffold(
      body: [
        const HomeScreen(),
        const RankingScreen(),
        const MenuScreen(),
      ][tabIndex],
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
        selectedIndex: tabIndex,
        onDestinationSelected: (index) {
          ref.read(mainScreenControllerProvider.notifier).updateTabIndex(index);
        },
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        animationDuration: const Duration(milliseconds: 100),
      ),
    );
  }
}
