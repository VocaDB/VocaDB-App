import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

/// A widget that displays simple information about album in card. Mostly use in horizontal list.
class AlbumCard extends StatelessWidget {
  /// Name of album that will display as title in card
  final String name;

  /// Name of artist that will display on second line
  final String artistName;

  /// Album image url for display in card
  final String imageUrl;

  /// Callback when tap
  final GestureTapCallback onTap;

  /// The width of card
  static const double cardWidth = 130;

  /// The height of thumbnail image
  static const double imageHeight = 130;

  const AlbumCard({this.name, this.artistName, this.imageUrl, this.onTap});

  /// Create AlbumCard widget by AlbumModel
  AlbumCard.album(
    AlbumModel album, {
    this.onTap,
  })  : this.name = album.name,
        this.artistName = album.artistString,
        this.imageUrl = album.imageUrl;

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
                height: imageHeight,
                color: Colors.black,
                child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: CustomNetworkImage(
                      this.imageUrl,
                    )),
              ),
              SpaceDivider.micro(),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(this.name,
                      style: Theme.of(context).textTheme.bodyText2,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis)),
              SpaceDivider.micro(),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(this.artistName,
                      style: Theme.of(context).textTheme.caption,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis)),
            ],
          ),
        ),
      ),
    );
  }
}
