import 'package:flutter/material.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';

/// A widget display text info with title. Used in entry description
class TextInfoSection extends StatelessWidget {
  final String title;

  /// A string value to display. Return empty container if [text] value is null or empty.
  final String text;

  final double horizontalPadding;

  final Widget? divider;

  const TextInfoSection({
    required this.title,
    required this.text,
    this.horizontalPadding = Sizes.p16,
    this.divider,
  });

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) {
      return Container();
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
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
