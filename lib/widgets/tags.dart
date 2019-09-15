import 'package:flutter/material.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/pages/tag_detail/tag_detail_page.dart';

class Tags extends StatefulWidget {
  final List<TagModel> _tags;

  const Tags(this._tags);

  @override
  _TagsState createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  List<Widget> tagList = List();

  int minimum = 5;

  @override
  void initState() {
    super.initState();

    if (widget._tags == null || widget._tags.length == 0) return;

    showMinimumTags();
  }

  Widget buildShowMoreChip() {
    return InputChip(
      label: Text('More (${widget._tags.length})'),
      onPressed: showAllTags,
    );
  }

  toTagDetailPage(TagModel tagModel) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TagDetailPage()));
  }

  Widget mapTagWidget(TagModel tagModel) {
    return Tag(tagModel, () {
      this.toTagDetailPage(tagModel);
    });
  }

  void showMinimumTags() {
    setState(() {
      tagList = widget._tags.take(this.minimum).map(mapTagWidget).toList();

      if (widget._tags.length > this.minimum) {
        tagList.add(buildShowMoreChip());
      }
    });
  }

  void showAllTags() {
    setState(() {
      tagList = widget._tags.map(mapTagWidget).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Wrap(
        children: tagList,
      ),
    );
  }
}

class Tag extends StatelessWidget {
  final TagModel _tag;
  final VoidCallback onPressed;

  const Tag(this._tag, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4.0),
      child: InputChip(
        label: Text(_tag.name),
        onPressed: this.onPressed,
      ),
    );
  }
}
