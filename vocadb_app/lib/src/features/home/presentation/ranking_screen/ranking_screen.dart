import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/responsive_center.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveCenter(
        child: Text(
          'Ranking',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
