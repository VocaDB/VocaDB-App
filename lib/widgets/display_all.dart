import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayAll extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const DisplayAll({Key key, this.title, this.children}) : super(key: key);

  static navigate(BuildContext context, String title, List<Widget> children) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                DisplayAll(title: title, children: children)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All')),
      body: ListView.builder(
        itemCount: children.length,
        itemBuilder: (context, index) {
          return children[index];
        },
      ),
    );
  }
}
