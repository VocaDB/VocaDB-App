import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

/// A widget to generate tags by list of tag model.
class TagGroupView extends StatelessWidget {
  /// The list of tag models.
  final List<TagModel> tags;

  /// Callback when pressed.
  final Function(TagModel) onPressed;

  const TagGroupView({this.tags, this.onPressed}) : assert(tags != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
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
