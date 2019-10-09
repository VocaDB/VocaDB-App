import 'package:flutter/material.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/widgets/section.dart';
import 'package:vocadb/widgets/song_card.dart';
import 'package:vocadb/widgets/song_tile.dart';

class SongListSection extends StatelessWidget {
  final String title;
  final List<SongModel> songs;
  final bool horizontal;
  final String prefixTag;
  final Widget extraMenus;

  const SongListSection(
      {Key key,
      this.songs,
      this.horizontal = false,
      this.prefixTag,
      this.title,
      this.extraMenus})
      : super(key: key);

  Widget mapSongWidget(SongModel song) {
    String tag = '${prefixTag}_song_${song.id}';
    return (horizontal)
        ? SongCard.song(song, tag: tag)
        : SongTile.fromSong(song, tag: tag);
  }

  @override
  Widget build(BuildContext context) {
    return Section(
        title: title,
        horizontal: true,
        extraMenus: extraMenus,
        children: songs.map<Widget>(mapSongWidget).toList());
  }
}
