import 'package:flutter/material.dart';
import 'package:vocadb_app/widgets.dart';

/// A widget for display Icon, title and subtitle
class InfoMessageView extends StatelessWidget {
  final Widget icon;

  final String title;

  final String subtitle;

  InfoMessageView({this.icon, @required this.title, this.subtitle})
      : assert(title != null);

  InfoMessageView.error({this.title, this.subtitle})
      : this.icon = Icon(Icons.error, size: 48);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            this.icon,
            SpaceDivider.small(),
            Text(this.title, style: Theme.of(context).textTheme.headline4),
            SpaceDivider.micro(),
            (this.subtitle != null)
                ? Text(this.subtitle,
                    style: Theme.of(context).textTheme.caption,
                    textAlign: TextAlign.center)
                : Container()
          ],
        ),
      ),
    );
  }
}
