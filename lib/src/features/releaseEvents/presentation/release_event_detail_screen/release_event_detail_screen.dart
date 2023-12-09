import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/common_widgets/async_value_widget.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/release_event_repository.dart';
import 'package:vocadb_app/src/features/releaseEvents/presentation/release_event_detail_screen/release_event_detail_button_bar.dart';
import 'package:vocadb_app/src/features/releaseEvents/presentation/release_event_detail_screen/widgets/release_event_albums_section.dart';
import 'package:vocadb_app/src/features/releaseEvents/presentation/release_event_detail_screen/widgets/release_event_artists_section.dart';
import 'package:vocadb_app/src/features/releaseEvents/presentation/release_event_detail_screen/widgets/release_event_detail_image.dart';
import 'package:vocadb_app/src/features/releaseEvents/presentation/release_event_detail_screen/widgets/release_event_detail_info.dart';
import 'package:vocadb_app/src/features/releaseEvents/presentation/release_event_detail_screen/widgets/release_event_detail_tags.dart';
import 'package:vocadb_app/src/features/releaseEvents/presentation/release_event_detail_screen/widgets/release_event_songs_section.dart';
import 'package:vocadb_app/src/features/releaseEvents/presentation/release_event_detail_screen/widgets/release_event_web_links_section.dart';

class ReleaseEventDetailScreen extends StatelessWidget {
  const ReleaseEventDetailScreen({super.key, required this.releaseEventId});
  final String releaseEventId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final value =
              ref.watch(releaseEventDetailProvider(int.parse(releaseEventId)));

          return AsyncValueWidget(
              value: value,
              data: (releaseEvent) {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 500,
                      pinned: true,
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.home),
                          onPressed: () {},
                        )
                      ],
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text(
                          releaseEvent.name ?? '<None>',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        background: SafeArea(
                          child: ReleaseEventDetailImage(
                              releaseEvent: releaseEvent),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate([
                        const ReleaseEventDetailButtonBar(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            gapH8,
                            ReleaseEventDetailTags(releaseEvent: releaseEvent),
                            gapH8,
                            ReleaseEventDetailInfo(releaseEvent: releaseEvent),
                            ReleaseEventArtistsSection(
                                releaseEvent: releaseEvent),
                            ReleaseEventSongsSection(
                                releaseEvent: releaseEvent),
                            ReleaseEventAlbumsSection(
                                releaseEvent: releaseEvent),
                            ReleaseEventWebLinksSection(
                                releaseEvent: releaseEvent),
                          ],
                        ),
                      ]),
                    )
                  ],
                );
              });
        },
      ),
    );
  }
}
