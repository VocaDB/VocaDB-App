import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/arguments.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/routes.dart';

/// An tag input widget for filter page
class TagInput extends StatelessWidget {
  /// Label input. Default is Tags
  final String label;

  /// Existing tag values
  final List<TagModel> values;

  /// Called when the user taps the deleteIcon.
  final Function(TagModel) onDeleted;

  /// Called when the user select tag.
  final Function(TagModel) onSelect;

  const TagInput(
      {this.label = 'Tags', this.values, this.onDeleted, this.onSelect});

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

  void _onBrowse() {
    Get.toNamed(Routes.TAGS, arguments: TagSearchArgs(selectionMode: true))
        .then(_postBrowse);
  }

  void _postBrowse(value) {
    if (value != null) {
      this.onSelect(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = [];

    items.add(ListTile(
      title: Text('tags'.tr),
    ));

    if (this.values != null && this.values.isNotEmpty) {
      items.addAll(this.values.map((e) => _tagBuilder(e)).toList());
    }

    items.add(ListTile(
      onTap: this._onBrowse,
      leading: Icon(Icons.add),
      title: Text('add'.tr),
    ));

    return Column(
      children: items,
    );
  }
}
