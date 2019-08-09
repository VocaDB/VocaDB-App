import 'package:flutter/material.dart';

class Tags extends StatelessWidget {
  const Tags({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 4.0),
            child: Chip(
              label: Text('electropop'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 4.0),
            child: Chip(
              label: Text('MMD'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 4.0),
            child: Chip(
              label: Text('More (18)'),
            ),
          ),
        ],
      ),
    );
  }
}