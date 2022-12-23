import 'package:flutter/material.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';

class SongInfo extends StatelessWidget {
  const SongInfo({super.key, required this.song});

  final Song song;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(song.name, style: Theme.of(context).textTheme.headline6),
          Text(song.additionalNames),
          gapH4,
          Text(song.songType),
        ],
      ),
    );
  }
}
