import 'package:flutter/material.dart';

class Section extends StatelessWidget {

  final String title;

  final List<Widget> children;

  Section({
    Key key,
    this.title,
    this.children
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      this.title,
                      textDirection: TextDirection.ltr,
                      style: Theme.of(context).textTheme.subhead,
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text('More'),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              // Horizontal ListView
              height: 170,
              child: ListView.builder(
                itemCount: this.children.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return this.children[index];
                },
              ),
            ),
          ],
        ));
  }
}