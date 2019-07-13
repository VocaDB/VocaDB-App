import 'package:flutter/material.dart';

class WebLink extends StatelessWidget {

  final String name;

  const WebLink({
    Key key,
    this.name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: 8, bottom: 8),
        height: 48,
        child: Row(
          children: <Widget>[
            Text(this.name, style: Theme.of(context).textTheme.subtitle)
          ],
        ),
      ),
    );
  }
}
