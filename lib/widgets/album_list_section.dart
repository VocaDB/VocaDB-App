import 'package:flutter/material.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/widgets/album_card.dart';
import 'package:vocadb/widgets/album_tile.dart';
import 'package:vocadb/widgets/section.dart';

class AlbumListSection extends StatelessWidget {
  final String title;
  final List<AlbumModel> albums;
  final bool horizontal;
  final String prefixTag;

  const AlbumListSection(
      {Key key,
      this.albums,
      this.horizontal = false,
      this.prefixTag,
      this.title})
      : super(key: key);

  Widget mapWidget(AlbumModel album) {
    String tag = '${prefixTag}_song_${album.id}';
    return (horizontal)
        ? AlbumCard.album(album, tag: tag)
        : AlbumTile.fromEntry(album, tag: tag);
  }

  @override
  Widget build(BuildContext context) {
    return Section(
        title: title,
        horizontal: true,
        children: albums.map<Widget>(mapWidget).toList());
  }
}
