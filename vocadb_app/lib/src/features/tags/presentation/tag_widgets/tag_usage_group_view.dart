import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';
import 'package:vocadb_app/src/features/tags/domain/tag_usage.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_widgets/tag_chip.dart';

/// A widget to generate tags by list of tag model.
class TagUsageGroupView extends StatefulWidget {
  /// The list of tag models.
  final List<TagUsage> tagUsages;

  /// Callback when pressed.
  final Function(Tag)? onSelectTag;

  /// A horizontal margin size. Default is 16.0
  final double margin;

  /// Minimum tags to display. Set to zero to display all
  final int minimumDisplayCount;

  const TagUsageGroupView(
      {super.key,
      this.tagUsages = const [],
      this.onSelectTag,
      this.margin = 16.0,
      this.minimumDisplayCount = 5});

  @override
  // ignore: library_private_types_in_public_api
  _TagUsageGroupViewState createState() => _TagUsageGroupViewState();
}

class _TagUsageGroupViewState extends State<TagUsageGroupView> {
  bool displayAll = false;

  void _onMorePressed() {
    setState(() {
      displayAll = true;
    });
  }

  Widget _mapTagWidget(TagUsage tagUsage) {
    return TagChip(
        label: tagUsage.tag.name,
        onSelect: () => (widget.onSelectTag != null)
            ? widget.onSelectTag!(tagUsage.tag)
            : null);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];

    if (widget.minimumDisplayCount > 0 &&
        !displayAll &&
        widget.tagUsages.length > widget.minimumDisplayCount) {
      items = widget.tagUsages
          .take(widget.minimumDisplayCount)
          .map(_mapTagWidget)
          .toList();
      items.add(InputChip(
        label: Text('More (${widget.tagUsages.length})'),
        onPressed: _onMorePressed,
      ));
    } else {
      items = widget.tagUsages.map(_mapTagWidget).toList();
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: widget.margin),
      child: Wrap(
        children: items,
      ),
    );
  }
}
