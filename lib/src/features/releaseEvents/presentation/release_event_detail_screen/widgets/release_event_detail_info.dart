import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';

class ReleaseEventDetailInfo extends StatelessWidget {
  const ReleaseEventDetailInfo({super.key, required this.releaseEvent});

  final ReleaseEvent releaseEvent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('Name'),
          subtitle: Text(releaseEvent.name ?? '<None>'),
        ),
        ListTile(
          title: const Text('Category'),
          subtitle: Text(releaseEvent.displayCategory ?? '<None>'),
        ),
        ListTile(
          title: const Text('Date'),
          subtitle: Text(releaseEvent.dateFormatted ?? '<None>'),
        ),
        Visibility(
          visible: releaseEvent.venueName != null &&
              releaseEvent.venueName!.isNotEmpty,
          child: ListTile(
            title: const Text('Venune'),
            subtitle: Text(releaseEvent.venueName ?? '<None>'),
          ),
        ),
        Visibility(
          visible: releaseEvent.series != null,
          child: ListTile(
            title: const Text('Series'),
            subtitle: Text(releaseEvent.series?.name ?? '<None>'),
          ),
        ),
        Visibility(
          visible: releaseEvent.description != null &&
              releaseEvent.description!.isNotEmpty,
          child: ListTile(
            title: const Text('Description'),
            subtitle: Text(releaseEvent.description ?? '<None>'),
          ),
        ),
      ],
    );
  }
}
