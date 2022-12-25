import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/responsive_center.dart';
import 'package:vocadb_app/src/features/home/presentation/app_bar/global_app_bar.dart';

// TODO : implement more UI detail
class EntriesSearchScreen extends StatelessWidget {
  const EntriesSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GlobalAppBar(
        title: 'Search',
        displayHome: false,
      ),
      body: ResponsiveCenter(
        child: Text(
          'Entries search',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
