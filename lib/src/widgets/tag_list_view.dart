import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/src/widgets/infinite_list_view.dart';

class TagListView extends StatelessWidget {
  final List<TagModel> tags;

  final Function(TagModel) onSelect;

  /// A callback function when user react to last item. Only worked on list view with vertical direction.
  final Function onReachLastItem;

  const TagListView({this.tags, this.onSelect, this.onReachLastItem});

  @override
  Widget build(BuildContext context) {
    return InfiniteListView(
        onReachLastItem: this.onReachLastItem,
        itemCount: tags.length,
        itemBuilder: (context, index) => ListTile(
            title: Text(tags[index].name), onTap: () => onSelect(tags[index])));
  }
}
