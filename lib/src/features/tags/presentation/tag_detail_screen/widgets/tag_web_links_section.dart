import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/section_divider.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';
import 'package:vocadb_app/src/features/weblinks/presentation/web_link_group_view.dart';

class TagWebLinksSection extends StatelessWidget {
  const TagWebLinksSection({super.key, required this.tag});

  final Tag tag;

  @override
  Widget build(BuildContext context) {
    return SectionDivider(
      visible: tag.webLinks.isNotEmpty,
      child: WebLinkGroupList(
        webLinks: tag.webLinks,
      ),
    );
  }
}
