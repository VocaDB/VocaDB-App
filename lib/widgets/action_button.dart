import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String label;

  final IconData icon;

  final GestureTapCallback onTap;

  const ActionButton({Key key, this.label, this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, color: Colors.white70),
              Text(label, style: Theme.of(context).textTheme.caption)
            ],
          )),
    );
  }
}