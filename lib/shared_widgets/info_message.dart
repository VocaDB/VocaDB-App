import 'package:flutter/material.dart';

class InfoMessage extends StatelessWidget {
  InfoMessage({this.icon, this.message});

  InfoMessage.warning({this.icon = Icons.warning, this.message});

  InfoMessage.error({this.icon = Icons.error, this.message});

  final IconData icon;

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          this.icon,
          size: 24.0,
        ),
        Text(this.message),
      ],
    );
  }
}
