import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// A widget for display image and cached. Display placeholder instead if image url is null.
class CustomNetworkImage extends StatelessWidget {
  /// An url of image to display.
  final String imageUrl;

  /// A placeholder widget to display when image loading.
  final Widget placeholder;

  /// A widget to display error when fail to load image.
  final Widget errorWidget;

  final BoxFit fit;

  const CustomNetworkImage(this.imageUrl,
      {this.placeholder, this.errorWidget, this.fit});

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return Placeholder();
    }

    return CachedNetworkImage(
      fit: this.fit,
      imageUrl: this.imageUrl,
      placeholder: (this.placeholder != null)
          ? this.placeholder
          : (context, url) => Container(color: Colors.grey),
      errorWidget: (this.errorWidget != null)
          ? this.errorWidget
          : (context, url, error) => new Icon(Icons.error),
    );
  }
}
