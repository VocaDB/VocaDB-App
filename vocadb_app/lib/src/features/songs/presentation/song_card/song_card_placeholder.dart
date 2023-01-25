import 'package:flutter/material.dart';

/// A widget display placeholder for song
class SongCardPlaceholder extends StatelessWidget {
  const SongCardPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
