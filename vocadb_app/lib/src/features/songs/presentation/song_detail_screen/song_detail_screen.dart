import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/responsive_center.dart';

class SongDetailScreen extends StatelessWidget {
  const SongDetailScreen({super.key, required this.songId});
  final String songId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Song Detail ID'),
        ),
        body: const ResponsiveCenter(
          child: Text(
            'Song Detail Screen',
            textAlign: TextAlign.center,
          ),
        ));
  }
}
