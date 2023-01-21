import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/custom_network_image.dart';
import 'package:vocadb_app/src/constants/config.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';

class ReleaseEventImageCard extends StatelessWidget {
  const ReleaseEventImageCard({
    super.key,
    required this.releaseEvent,
  });

  final ReleaseEvent releaseEvent;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      child: Container(
        color: Colors.black12,
        child: CustomNetworkImage(
          releaseEvent.imageUrl ?? kPlaceholderImageUrl,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
