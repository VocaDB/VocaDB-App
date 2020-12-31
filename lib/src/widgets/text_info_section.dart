import 'package:flutter/material.dart';

/// A widget display text info with title. Used in entry description
class TextInfoSection extends StatelessWidget {
  final String title;

  final String text;

  final double horizontalPadding;

  const TextInfoSection(
      {Key key, this.title, this.text, this.horizontalPadding = 16.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.text == null || this.text.isEmpty) {
      return Container();
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: this.horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.caption,
          ),
          Text(text),
        ],
      ),
    );
  }
}
