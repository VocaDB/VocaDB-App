import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

/// A widget that displays simple information about song in card. Mostly use in horizontal list.
class SongCard extends StatelessWidget {
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

  /// The width of card
  static const double cardWidth = 130;

  /// The height of thumbnail image
  static const double thumbnailHeight = 100;

  const SongCard(
      {this.name,
      this.artistName,
      this.songType,
      this.thumbUrl,
      this.hasPV = false,
      this.onTap});

  /// Create SongCard widget by SongModel
  SongCard.song(SongModel song, {Key key, this.onTap})
      : this.name = song.name,
        this.artistName = song.artistString,
        this.songType = song.songType,
        this.thumbUrl = song.imageUrl,
        this.hasPV = song.youtubePV != null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: this.onTap,
        child: Container(
          width: cardWidth,
          margin: EdgeInsets.only(right: 8.0, left: 8.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: thumbnailHeight,
                color: Colors.black,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: CustomNetworkImage(
                    this.thumbUrl,
                  ),
                ),
              ),
              SpaceDivider.micro(),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(this.name,
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis)),
              SpaceDivider.micro(),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(this.artistName,
                      style: Theme.of(context).textTheme.caption,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis)),
              SpaceDivider.micro(),
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
      ),
    );
  }
}
