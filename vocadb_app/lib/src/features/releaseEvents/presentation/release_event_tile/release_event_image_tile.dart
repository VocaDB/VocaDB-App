import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/custom_network_image.dart';
import 'package:vocadb_app/src/constants/config.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';

class ReleaseEventImageTile extends StatelessWidget {
  const ReleaseEventImageTile({super.key, required this.releaseEvent});

  final ReleaseEvent releaseEvent;

  @override
  Widget build(BuildContext context) {
    return CustomNetworkImage(
      releaseEvent.imageUrl ?? kPlaceholderImageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
