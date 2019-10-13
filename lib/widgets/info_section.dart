import 'package:flutter/material.dart';
import 'package:vocadb/widgets/space_divider.dart';

class InfoSection extends StatelessWidget {
  final String title;
  final Widget child;
  final bool visible;

  const InfoSection({Key key, this.title, this.child, this.visible = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!this.visible) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.caption,
        ),
        child,
        SpaceDivider()
      ],
    );
  }
}
