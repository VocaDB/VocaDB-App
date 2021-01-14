import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/src/widgets/custom_network_image.dart';

/// A widget for display album information in vertical list
class AlbumTile extends StatelessWidget {
  /// Name of album that will display as title in card
  final String name;

  /// Name of artist that will display on second line
  final String artist;

  /// Album image url to display in widget
  final String imageUrl;

  /// Callback when tap
  final GestureTapCallback onTap;

  /// Album image size both width and height
  static const double imageSize = 50;

  const AlbumTile({Key key, this.name, this.artist, this.imageUrl, this.onTap})
      : super(key: key);

  AlbumTile.fromEntry(EntryModel entry, {this.onTap})
      : this.name = entry.name,
        this.imageUrl = entry.imageUrl,
        this.artist = entry.artistString;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: this.onTap,
      leading: SizedBox(
        width: imageSize,
        height: imageSize,
        child: CustomNetworkImage(
          this.imageUrl,
          fit: BoxFit.fill,
        ),
      ),
      title: Text(this.name, overflow: TextOverflow.ellipsis),
      subtitle: Text(this.artist, overflow: TextOverflow.ellipsis),
    );
  }
}
