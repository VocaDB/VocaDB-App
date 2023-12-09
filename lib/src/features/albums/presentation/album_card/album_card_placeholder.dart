import 'package:flutter/material.dart';

/// A widget display placeholder for album
class AlbumCardPlaceholder extends StatelessWidget {
  const AlbumCardPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: const Text('Placeholder'),
    );
  }
}
