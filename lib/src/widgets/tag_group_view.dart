import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

/// A widget to generate tags by list of tag model.
class TagGroupView extends StatefulWidget {
  /// The list of tag models.
  final List<TagModel> tags;

  /// Callback when pressed.
  final Function(TagModel) onPressed;

  /// A horizontal margin size. Default is 16.0
  final double margin;

  /// Minimum tags to display. Set to zero to display all
  final int minimumDisplayCount;

  const TagGroupView(
      {this.tags,
      this.onPressed,
      this.margin = 16.0,
      this.minimumDisplayCount = 5})
      : assert(tags != null);

  @override
  _TagGroupViewState createState() => _TagGroupViewState();
}

class _TagGroupViewState extends State<TagGroupView> {
  bool displayAll = false;

  void _onMorePressed() {
    setState(() {
      this.displayAll = true;
    });
  }

  Widget _mapTagWidget(TagModel tagModel) {
    return new Tag(
        label: tagModel.name,
        onPressed: () => (this.widget.onPressed != null)
            ? this.widget.onPressed(tagModel)
            : null);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];

    if (widget.minimumDisplayCount > 0 &&
        !displayAll &&
        widget.tags.length > widget.minimumDisplayCount) {
      items = widget.tags
          .take(this.widget.minimumDisplayCount)
          .map(this._mapTagWidget)
          .toList();
      items.add(InputChip(
        label: Text('More (${this.widget.tags.length})'),
        onPressed: this._onMorePressed,
      ));
    } else {
      items = widget.tags.map(this._mapTagWidget).toList();
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: this.widget.margin),
      child: Wrap(
        children: items,
      ),
    );
  }
}
