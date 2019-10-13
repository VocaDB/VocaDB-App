import 'package:flutter/material.dart';

class AdditionInfo extends StatelessWidget {

  final String title;

  final String value;

  const AdditionInfo({Key key, this.title, this.value}) : super(key :key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(this.title, style: Theme.of(context).textTheme.caption),
          Text(this.value, style: Theme.of(context).textTheme.body1),
        ],
      ),
    );
  }
}