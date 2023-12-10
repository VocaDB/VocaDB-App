import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/home/presentation/ranking_screen/ranking_filter_filter_by_radio_group.dart';
import 'package:vocadb_app/src/features/home/presentation/ranking_screen/ranking_filter_vocalist_radio_group.dart';

class RankingFilterScreen extends StatelessWidget {
  const RankingFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: const [
          RankingFilterFilterByRadioGroup(),
          RankingFilterVocalistRadioGroup(),
        ],
      ),
    );
  }
}
