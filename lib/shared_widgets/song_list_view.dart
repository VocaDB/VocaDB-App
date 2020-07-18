import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vocadb/models/models.dart';
import 'package:vocadb/shared_widgets/shared_widgets.dart';
import 'package:vocadb/views/views.dart';

class SongListView extends StatelessWidget {
  SongListView(
      {Key key,
      this.songs,
      this.horizontal = false,
      this.displayNumber = false,
      this.tag = 'songListView'})
      : assert(songs != null),
        super(key: key);

  /// List of songs to display
  final List<SongModel> songs;

  /// Direction to display
  final bool horizontal;

  /// Display number order. Used for ranking list. Default is false
  final bool displayNumber;

  /// For Hero widget animation. Format '{$tag}_{$songId}'
  /// Example
  /// tag = 'top_songs
  /// Inside song card widget tag will be 'top_songs_39'
  final String tag;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 180,
        child: ListView.builder(
            itemCount: this.songs.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              SongModel song = this.songs[index];
              return SongCard.song(song, tag: tag + '_' + song.id.toString());
            }));
  }
}
