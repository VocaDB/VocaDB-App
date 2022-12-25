import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/responsive_center.dart';

// TODO : need implementation
class RankingFilterScreen extends StatelessWidget {
  const RankingFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ResponsiveCenter(
        child: Text(
          'Ranking Filter',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
