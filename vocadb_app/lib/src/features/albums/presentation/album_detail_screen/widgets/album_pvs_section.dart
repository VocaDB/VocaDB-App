import 'package:flutter/src/widgets/framework.dart';
import 'package:vocadb_app/src/common_widgets/section_divider.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/pvs/presentation/pv_list/pv_group_list.dart';

class AlbumPVsSection extends StatelessWidget {
  const AlbumPVsSection({super.key, required this.album});

  final Album album;
  @override
  Widget build(BuildContext context) {
    return SectionDivider(
      visible: album.pvs.isNotEmpty,
      child: PVGroupList(
        pvs: album.pvs,
        searchQuery: '',
      ),
    );
  }
}
