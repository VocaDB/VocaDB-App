import 'package:flutter/material.dart';

/// A widget to display small info and given child.
class InfoSection extends StatelessWidget {
  final String title;
  final Widget child;

  final double horizontalPadding;

  const InfoSection(
      {Key key, this.title, this.child, this.horizontalPadding = 16.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: this.horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.caption,
          ),
          child,
        ],
      ),
    );
  }
}
