import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/custom_network_image.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';

class ReleaseEventCard extends StatelessWidget {
  const ReleaseEventCard({
    super.key,
    required this.releaseEvent,
    required this.onTap,
  });

  final ReleaseEvent releaseEvent;

  /// Callback when tap
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 320,
          child: Stack(
            fit: StackFit.expand,
            alignment: AlignmentDirectional.bottomCenter,
            textDirection: TextDirection.ltr,
            children: [
              CustomNetworkImage(
                releaseEvent.imageUrl!,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 52,
                  color: Colors.black.withOpacity(0.8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
                      child: Text(releaseEvent.name ?? '<None>',
                          maxLines: 2, overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
