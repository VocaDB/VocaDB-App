import 'package:flutter/material.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/pages/tag_detail/tag_detail_page.dart';

class Tags extends StatelessWidget {
  final List<TagModel> _tags;

  const Tags(this._tags);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Wrap(
        children: this._tags.map((t) => Tag(t)).toList(),
      ),
    );
  }
}

class Tag extends StatelessWidget {
  final TagModel _tag;

  const Tag(this._tag);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4.0),
      child: InputChip(
        label: Text('#' + _tag.name),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TagDetailPage()));
        },
      ),
    );
  }
}
