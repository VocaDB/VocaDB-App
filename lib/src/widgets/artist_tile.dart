import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/src/widgets/custom_network_image.dart';

/// A widget for display artist information in vertical list
class ArtistTile extends StatelessWidget {
  /// Name of artist that will display as title in card
  final String name;

  /// A string value display below name if not null
  final String subtitle;

  /// An artist image url to display in widget
  final String imageUrl;

  /// An artist image size both width and height
  static const double imageSize = 50;

  /// Callback when tap
  final GestureTapCallback onTap;

  const ArtistTile(
      {Key key, this.name, this.imageUrl, this.onTap, this.subtitle})
      : super(key: key);

  ArtistTile.fromEntry(EntryModel entry, {this.onTap, this.subtitle})
      : this.name = entry.name,
        this.imageUrl = entry.imageUrl;

  Widget _leading() {
    final Widget imageChild = (this.imageUrl == null)
        ? Icon(Icons.person)
        : CustomNetworkImage(
            this.imageUrl,
          );

    return SizedBox(
      width: imageSize,
      height: imageSize,
      child: ClipOval(
          child: Container(
        color: Colors.white,
        child: imageChild,
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: this.onTap,
      leading: _leading(),
      title: Text(this.name, overflow: TextOverflow.ellipsis),
      subtitle: (subtitle == null) ? null : Text(subtitle),
    );
  }
}
