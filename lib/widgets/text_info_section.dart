import 'package:flutter/material.dart';
import 'package:vocadb/widgets/space_divider.dart';

class TextInfoSection extends StatelessWidget {
  final String title;
  final String text;

  const TextInfoSection({Key key, this.title, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.text == null || this.text.isEmpty) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.caption,
        ),
        Text(text),
        SpaceDivider()
      ],
    );
  }
}
