import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/custom_network_image.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/domain/release_event.dart';
import 'package:vocadb_app/src/utils/date_time_utils.dart';

/// A widget to display release event information for horizontal list.
class ReleaseEventTile extends StatelessWidget {
  final ReleaseEvent releaseEvent;

  final GestureTapCallback? onTap;

  /// The height of image preview. Default is 180
  final double imageHeight;

  const ReleaseEventTile(
      {super.key,
      required this.releaseEvent,
      this.imageHeight = 180,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    final String? dateRange = (releaseEvent.date == null)
        ? null
        : (releaseEvent.endDate == null)
            ? DateTimeUtils.toSimpleFormat(releaseEvent.date)
            : '${DateTimeUtils.toSimpleFormat(releaseEvent.date)} - ${DateTimeUtils.toSimpleFormat(releaseEvent.endDate)}';

    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: onTap,
          child: Column(
            children: [
              SizedBox(
                height: imageHeight,
                child: Stack(
                  children: [
                    Container(
                      color: Colors.black,
                    ),
                    Container(
                        child: CustomNetworkImage(
                      releaseEvent.imageUrl!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    )),
                    (dateRange == null)
                        ? Container()
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Card(
                                color: Colors.black,
                                margin: const EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    dateRange,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    gapH4,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          releaseEvent.category ?? 'None',
                          style: Theme.of(context).textTheme.caption,
                        ),
                        (releaseEvent.venueName == null)
                            ? Container()
                            : Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 4.0),
                                    child: const Icon(
                                      Icons.place,
                                      size: 12,
                                    ),
                                  ),
                                  Text(
                                    releaseEvent.venueName ?? ' ',
                                    style: Theme.of(context).textTheme.caption,
                                  )
                                ],
                              )
                      ],
                    ),
                    gapH4,
                    Text(
                      releaseEvent.name ?? '<None>',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    gapH4,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
