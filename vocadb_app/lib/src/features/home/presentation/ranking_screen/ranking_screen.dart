import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/responsive_center.dart';
import 'package:vocadb_app/src/features/home/presentation/app_bar/global_app_bar.dart';

// TODO : need implementation
class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GlobalAppBar(
        title: 'VocaDB',
        displayHome: false,
      ),
      body: ResponsiveCenter(
        child: Text(
          'Ranking',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
