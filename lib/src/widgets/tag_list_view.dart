import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';

class TagListView extends StatelessWidget {
  final List<TagModel> tags;

  const TagListView({this.tags});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tags.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(tags[index].name),
            ));
  }
}
