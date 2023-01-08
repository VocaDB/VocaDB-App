import 'package:flutter/material.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';

class SongDetailInfoSection extends StatelessWidget {
  const SongDetailInfoSection({super.key, required this.song});

  final Song song;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(song.name ?? '<Song name>',
              style: Theme.of(context).textTheme.headline6),
          (song.additionalNames != null && song.additionalNames!.isNotEmpty)
              ? Text(song.additionalNames!)
              : Container(),
          gapH4,
          (song.songType != null && song.songType!.isNotEmpty)
              ? Text(song.songType!)
              : Container(),
        ],
      ),
    );
  }
}