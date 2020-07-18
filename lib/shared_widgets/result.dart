import 'package:flutter/material.dart';
import 'package:vocadb/shared_widgets/shared_widgets.dart';

class Result extends StatelessWidget {
  final Widget _icon;
  final String _title;
  final String _subtitle;

  Result(Widget icon, String title, {String subtitle})
      : this._icon = icon,
        this._title = title,
        this._subtitle = subtitle;

  Result.error(String title, {String subtitle})
      : this._icon = Icon(Icons.error, size: 48),
        this._title = title,
        this._subtitle = subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _icon,
            SpaceDivider.small(),
            Text(_title, style: Theme.of(context).textTheme.title),
            SpaceDivider.small(),
            (_subtitle != null)
                ? Text(_subtitle,
                    style: Theme.of(context).textTheme.caption,
                    textAlign: TextAlign.center)
                : Container()
          ],
        ),
      ),
    );
  }
}
