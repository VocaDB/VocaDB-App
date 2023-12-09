import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/custom_network_image.dart';

class SongHeroImage extends StatelessWidget {
  const SongHeroImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      color: Colors.black,
      child: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: CustomNetworkImage(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: CustomNetworkImage(
              imageUrl,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
