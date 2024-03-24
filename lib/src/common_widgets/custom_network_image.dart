import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// A widget for display image and cached. Display placeholder instead if image url is null.
class CustomNetworkImage extends StatelessWidget {
  /// An url of image to display.
  final String imageUrl;

  /// A placeholder widget to display when image loading.
  // final Widget placeholder;

  /// A widget to display error when fail to load image.
  final Widget errorWidget;

  final BoxFit fit;

  final double width;

  final double height;

  const CustomNetworkImage(
    this.imageUrl, {
    super.key,
    // this.placeholder,
    this.errorWidget = const Icon(Icons.error),
    this.fit = BoxFit.cover,
    this.width = 140,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      imageUrl: imageUrl,
      width: width,
      height: height,
      placeholder: (context, url) => Container(color: Colors.grey),
      errorWidget: (context, url, error) => errorWidget,
    );
  }
}
