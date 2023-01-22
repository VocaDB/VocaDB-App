import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/section_divider.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';
import 'package:vocadb_app/src/features/weblinks/presentation/web_link_group_view.dart';

class ReleaseEventWebLinksSection extends StatelessWidget {
  const ReleaseEventWebLinksSection({super.key, required this.releaseEvent});

  final ReleaseEvent releaseEvent;

  @override
  Widget build(BuildContext context) {
    return SectionDivider(
      visible: releaseEvent.webLinks.isNotEmpty,
      child: WebLinkGroupList(
        webLinks: releaseEvent.webLinks,
      ),
    );
  }
}
