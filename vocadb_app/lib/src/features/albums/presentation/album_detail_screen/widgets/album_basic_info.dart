import 'package:flutter/material.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';

class AlbumBasicInfo extends StatelessWidget {
  const AlbumBasicInfo({super.key, required this.album});

  final Album album;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
      child: Column(
        children: [
          gapH8,
          Text(
            album.name!,
            style: Theme.of(context).textTheme.titleLarge,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          gapH8,
          Text(album.artistString!),
          gapH4,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${album.discType} • ${album.releaseDate!.formatted}',
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          )
        ],
      ),
    );
  }
}
