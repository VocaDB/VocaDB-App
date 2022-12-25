import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/common_widgets/responsive_center.dart';
import 'package:vocadb_app/src/features/home/presentation/app_bar/global_app_bar.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

// TODO : need implementation
class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: 'VocaDB',
        displayHome: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {
              GoRouter.of(context).pushNamed(AppRoute.rankingFilters.name);
            },
          ),
        ],
      ),
      body: const ResponsiveCenter(
        child: Text(
          'Ranking',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
