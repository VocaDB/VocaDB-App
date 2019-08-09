import 'package:flutter/material.dart';

class Section extends StatelessWidget {

  final String title;

  final List<Widget> children;

  final bool horizontal;

  final EdgeInsets padding;

  Section({
    Key key,
    this.title,
    this.children,
    this.horizontal = false,
    this.padding = EdgeInsets.zero
  }) : super(key: key);

  Widget buildVerticalItems(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(8.0),
          child: Text(
            this.title,
            textDirection: TextDirection.ltr,
            style: Theme.of(context).textTheme.subhead,
          ),
        ),
        Container(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            )
        )
      ],
    );
  }

  Widget buildHorizontalItems(BuildContext context) {
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
            Container(
              padding: EdgeInsets.only(bottom: 16.0),
              child: SizedBox(
                // Horizontal ListView
                height: 180,
                child: ListView.builder(
                  itemCount: this.children.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return this.children[index];
                  },
                ),
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return (horizontal)? buildHorizontalItems(context) : buildVerticalItems(context);
  }
}