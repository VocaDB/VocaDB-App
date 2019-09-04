import 'package:flutter/material.dart';

class WebLink extends StatelessWidget {

  final String name;

  const WebLink({
    Key key,
    this.name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.web),
      title: Text(this.name),
    );
  }
}
