import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

/// A widget to generate tags by list of tag model.
class TagGroupView extends StatelessWidget {
  /// The list of tag models.
  final List<TagModel> tags;

  /// Callback when pressed.
  final Function(TagModel) onPressed;

  /// A horizontal margin size. Default is 16.0
  final double margin;

  const TagGroupView({this.tags, this.onPressed, this.margin = 16.0})
      : assert(tags != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: this.margin),
      child: Wrap(
        children: tags
            .map((e) => Tag(
                label: e.name,
                onPressed: () =>
                    (this.onPressed != null) ? this.onPressed(e) : null))
            .toList(),
      ),
    );
  }
}
