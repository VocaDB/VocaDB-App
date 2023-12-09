import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/custom_network_image.dart';
import 'package:vocadb_app/src/constants/config.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';

class ReleaseEventDetailImage extends StatelessWidget {
  const ReleaseEventDetailImage({super.key, required this.releaseEvent});

  final ReleaseEvent releaseEvent;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: Visibility(
        visible: true,
        child: CustomNetworkImage(
          releaseEvent.imageUrl ?? kPlaceholderImageUrl,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
