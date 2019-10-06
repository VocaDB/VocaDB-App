import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String label;

  final IconData icon;

  final GestureTapCallback onTap;

  final bool selected;

  const ActionButton(
      {Key key, this.label, this.icon, this.onTap, this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon,
              color: (this.selected)
                  ? theme.primaryIconTheme.color
                  : theme.iconTheme.color),
          SizedBox(
            height: 4,
          ),
          Text(label, style: Theme.of(context).textTheme.caption)
        ],
      )),
    );
  }
}
