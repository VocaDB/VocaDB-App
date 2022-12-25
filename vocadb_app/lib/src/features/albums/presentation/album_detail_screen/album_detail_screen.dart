import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/responsive_center.dart';
import 'package:vocadb_app/src/features/home/presentation/app_bar/global_app_bar.dart';

// TODO : need implementation
class AlbumDetailScreen extends StatelessWidget {
  const AlbumDetailScreen({super.key, required this.albumId});
  final String albumId;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GlobalAppBar(
        title: 'Album detail',
      ),
      body: ResponsiveCenter(
        child: Text(
          'Album detail',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
