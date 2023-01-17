import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/custom_network_image.dart';
import 'package:vocadb_app/src/constants/config.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';

class TagDetailImage extends StatelessWidget {
  const TagDetailImage({super.key, required this.tag});

  final Tag tag;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: Visibility(
        visible: true,
        child: CustomNetworkImage(
          (tag.imageUrl == null) ? kPlaceholderImageUrl : tag.imageUrl!,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
