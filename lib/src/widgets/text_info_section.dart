import 'package:flutter/material.dart';

/// A widget display text info with title. Used in entry description
class TextInfoSection extends StatelessWidget {
  final String title;

  /// A string value to display. Return empty container if [text] value is null or empty.
  final String text;

  final double horizontalPadding;

  final Widget divider;

  const TextInfoSection(
      {Key key,
      this.title,
      this.text,
      this.horizontalPadding = 16.0,
      this.divider})
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
          divider ?? Container()
        ],
      ),
    );
  }
}
