import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/home/presentation/app_bar/global_app_bar.dart';
import 'package:vocadb_app/src/features/home/presentation/home_screen/highlighted_section.dart';
import 'package:vocadb_app/src/features/home/presentation/home_screen/home_content_list.dart';
import 'package:vocadb_app/src/features/home/presentation/home_screen/recent_albums_section.dart';

import 'random_albums_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GlobalAppBar(
        title: 'VocaDB',
        displayHome: false,
      ),
      body: HomeContentList(
        children: [
          HighlightedSection(),
          RecentAlbumSection(),
          RandomAlbumSection(),
        ],
      ),
    );
  }
}
