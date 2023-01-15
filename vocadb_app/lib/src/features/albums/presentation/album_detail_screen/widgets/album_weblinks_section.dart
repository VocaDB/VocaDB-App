import 'package:flutter/src/widgets/framework.dart';
import 'package:vocadb_app/src/common_widgets/section_divider.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/weblinks/presentation/web_link_group_view.dart';

class AlbumWebLinksSection extends StatelessWidget {
  const AlbumWebLinksSection({super.key, required this.album});

  final Album album;

  @override
  Widget build(BuildContext context) {
    return SectionDivider(
      visible: album.webLinks.isNotEmpty,
      child: WebLinkGroupList(
        webLinks: album.webLinks,
      ),
    );
  }
}
