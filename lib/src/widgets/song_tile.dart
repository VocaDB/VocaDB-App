import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/src/widgets/custom_network_image.dart';
import 'package:vocadb_app/widgets.dart';

/// A widget for display song information in vertical list
class SongTile extends StatelessWidget {
  /// Name of song that will display as title in card
  final String name;

  /// Name of artist that will display on second line
  final String artistName;

  /// Type of song. It will display as mini symbol in card base on type of song
  final String songType;

  /// Song's thumbnail url for display in card
  final String thumbUrl;

  /// If this value is true, Video icon will display on bottom of card.
  final bool hasPV;

  /// Callback when tap
  final GestureTapCallback onTap;

  /// A widget that display on leftmost side
  final Widget leading;

  /// The height of widget
  static const double height = 100;

  /// The width of thumbnail
  static const double thumbnailWidth = 120;

  const SongTile(
      {this.name,
      this.artistName,
      this.songType,
      this.thumbUrl,
      this.hasPV = false,
      this.leading,
      this.onTap});

  /// Create SongTile widget by SongModel
  SongTile.song(SongModel song, {this.onTap, this.leading})
      : this.name = song.name,
        this.artistName = song.artistString,
        this.songType = song.songType,
        this.thumbUrl = song.thumbUrl,
        this.hasPV = song.youtubePV != null;

  /// Create SongTile widget by EntryModel
  SongTile.fromEntry(EntryModel entryModel, {this.onTap, this.leading})
      : this.name = entryModel.name,
        this.artistName = entryModel.artistString,
        this.songType = entryModel.songType,
        this.thumbUrl = entryModel.imageUrl,
        this.hasPV = false;

  Widget _leadingBuilder() {
    if (this.leading == null) {
      return Container();
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: this.leading,
    );
  }

  Widget _thumbnailBuilder() {
    Widget thumbnail = (this.thumbUrl != null && this.thumbUrl.isNotEmpty)
        ? CustomNetworkImage(this.thumbUrl, fit: BoxFit.cover)
        : Icon(Icons.music_note);

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: thumbnailWidth,
          child: thumbnail,
        ));
  }

  Widget _infoBuilder(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(this.name, overflow: TextOverflow.ellipsis),
            Text(this.artistName,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.caption),
            SpaceDivider(8.0),
            Row(
              children: <Widget>[
                SongTypeSymbol(
                  songType: this.songType,
                ),
                (this.hasPV) ? Icon(Icons.local_movies) : Container()
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Container(
        height: height,
        child: Row(
          children: <Widget>[
            _leadingBuilder(),
            _thumbnailBuilder(),
            _infoBuilder(context),
          ],
        ),
      ),
    );
  }
}
