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

  /// A string value to give unique tag on hero widget. Hero widget will be used if value is not empty.
  final String prefixHeroTag;

  /// A string unique value give to hero widget. Use [imageUrl] instead if is Null.
  final String heroTag;

  /// An artist image size both width and height
  static const double imageSize = 50;

  /// Callback when tap
  final GestureTapCallback onTap;

  const ArtistTile(
      {Key key,
      this.name,
      this.imageUrl,
      this.onTap,
      this.subtitle,
      this.prefixHeroTag = '',
      this.heroTag})
      : super(key: key);

  ArtistTile.fromEntry(EntryModel entry,
      {this.onTap, this.subtitle, this.prefixHeroTag = '', this.heroTag})
      : this.name = entry.name,
        this.imageUrl = entry.imageUrl;

  Widget _leading() {
    final Widget imageChild = (this.imageUrl == null)
        ? Icon(Icons.person)
        : CustomNetworkImage(
            this.imageUrl,
            prefixHeroTag: this.prefixHeroTag,
            heroTag: this.heroTag,
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
