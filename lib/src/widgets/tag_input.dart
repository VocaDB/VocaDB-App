import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

/// An tag input widget for filter page
class TagInput extends StatelessWidget {
  /// Label input. Default is Tags
  final String label;

  /// Existing tag values
  final List<TagModel> values;

  /// Called when the user taps the deleteIcon.
  final Function(TagModel) onDeleted;

  /// Called when the user taps the add tag.
  final VoidCallback onAddPressed;

  const TagInput(
      {this.label = 'Tags', this.values, this.onDeleted, this.onAddPressed});

  Widget _tagBuilder(TagModel tagModel) {
    return Tag(
      label: tagModel.name,
      onDeleted: () => this.onDeleted(tagModel),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items =
        (this.values != null) ? this.values.map(_tagBuilder).toList() : [];

    if (this.onAddPressed != null) {
      items.add(Tag(
        avatar: Icon(Icons.add),
        label: 'Add',
        onPressed: this.onAddPressed,
      ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          this.label,
          style: Theme.of(context).textTheme.caption,
        ),
        SpaceDivider(8.0),
        Wrap(
          children: items,
        ),
        SpaceDivider(8.0),
      ],
    );
  }
}
