import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/responsive_center.dart';

class AlbumDetailScreen extends StatelessWidget {
  const AlbumDetailScreen({super.key, required this.albumId});
  final String albumId;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveCenter(
        child: Text(
          'Album detail',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
