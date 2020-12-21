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
    return ListTile(
      leading: Icon(Icons.label),
      title: Text(tagModel.name),
      trailing: (this.onDeleted == null)
          ? null
          : IconButton(
              icon: Icon(Icons.close),
              onPressed: () => this.onDeleted(tagModel),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = [];

    items.add(ListTile(
      title: Text('Tags'),
    ));

    if (this.values != null && this.values.isNotEmpty) {
      items.addAll(this.values.map((e) => _tagBuilder(e)).toList());
    }

    if (this.onAddPressed != null) {
      items.add(ListTile(
        onTap: this.onAddPressed,
        leading: Icon(Icons.add),
        title: Text('ADD TAG'),
      ));
    }

    return Column(
      children: items,
    );
  }
}
