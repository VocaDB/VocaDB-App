import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/widgets/display_all.dart';
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
    if (songs.length > 10 && extraMenus == null) {
      return Section(
          title: title,
          horizontal: true,
          extraMenus: PopupMenuButton<String>(
            icon: Icon(Icons.more_horiz),
            onSelected: (String selectedValue) {
              DisplayAll.navigate(
                  context,
                  'More songs',
                  songs
                      .map((v) => SongTile.fromSong(v,
                          tag: '${this.prefixTag}_${v.id}'))
                      .toList());
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'more',
                child: Text(FlutterI18n.translate(context, 'label.showMore')),
              ),
            ],
          ),
          children: songs.take(10).map<Widget>(mapSongWidget).toList());
    }

    return Section(
        title: title,
        horizontal: true,
        extraMenus: extraMenus,
        children: songs.map<Widget>(mapSongWidget).toList());
  }
}
