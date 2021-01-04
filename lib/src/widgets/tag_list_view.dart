import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';

class TagListView extends StatelessWidget {
  final List<TagModel> tags;

  final Function(TagModel) onSelect;

  const TagListView({this.tags, this.onSelect});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tags.length,
        itemBuilder: (context, index) => ListTile(
            title: Text(tags[index].name), onTap: () => onSelect(tags[index])));
  }
}
