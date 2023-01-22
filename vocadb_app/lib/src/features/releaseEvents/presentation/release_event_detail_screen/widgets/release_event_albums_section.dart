import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/section_divider.dart';
import 'package:vocadb_app/src/features/albums/data/constants/fake_albums_list.dart';
import 'package:vocadb_app/src/features/albums/presentation/albums_list/album_list_view.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';
import 'package:vocadb_app/src/routing/app_route_context.dart';

class ReleaseEventAlbumsSection extends StatelessWidget {
  const ReleaseEventAlbumsSection({super.key, required this.releaseEvent});

  final ReleaseEvent releaseEvent;

  @override
  Widget build(BuildContext context) {
    return SectionDivider(
      title: 'Albums',
      visible: true,
      child: AlbumListView(
        scrollDirection: Axis.horizontal,
        albums: kFakeAlbumsList,
        onSelect: context.goAlbumDetail,
      ),
    );
  }
}
