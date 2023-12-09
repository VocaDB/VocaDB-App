import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/custom_network_image.dart';

class SongCardImage extends StatelessWidget {
  final String imageUrl;

  final double width;

  final double height;

  const SongCardImage({
    super.key,
    required this.imageUrl,
    this.width = double.infinity,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: FittedBox(
        fit: BoxFit.fill,
        child: CustomNetworkImage(
          imageUrl,
        ),
      ),
    );
  }
}
