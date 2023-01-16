import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';

class ArtistDetailDesc extends StatelessWidget {
  const ArtistDetailDesc({super.key, required this.artist});

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    if (artist.description == null) {
      return Container();
    }

    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: ((context) {
            return _ArtistDetailDescBottomSheet(
              context: context,
              artist: artist,
            ).build();
          }),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(Sizes.p16),
        child: Text(
          artist.description!,
          maxLines: 4,
          overflow: TextOverflow.fade,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}

class _ArtistDetailDescBottomSheet {
  const _ArtistDetailDescBottomSheet(
      {required this.context, required this.artist});

  final Artist artist;

  final BuildContext context;

  Widget build() {
    return Padding(
      padding: const EdgeInsets.all(Sizes.p16),
      child: ListView(
        children: [
          Row(
            children: [
              IconButton(
                padding: const EdgeInsets.all(0),
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          gapH12,
          Text(
            artist.name!,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          gapH16,
          MarkdownBody(
            data: artist.description!,
            selectable: true,
          )
        ],
      ),
    );
  }
}
