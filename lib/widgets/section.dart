import 'package:flutter/material.dart';
import 'package:vocadb/widgets/space_divider.dart';

class Section extends StatelessWidget {
  final String title;

  final List<Widget> children;

  final bool horizontal;

  final EdgeInsets padding;

  final Widget extraMenus;

  Section(
      {Key key,
      this.title,
      this.children,
      this.extraMenus,
      this.horizontal = false,
      this.padding = EdgeInsets.zero})
      : super(key: key);

  Widget buildVerticalItems(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            this.title,
            textDirection: TextDirection.ltr,
            style: Theme.of(context).textTheme.subhead,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SpaceDivider(),
        Container(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ))
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
            child: SizedBox(
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    this.title,
                    textDirection: TextDirection.ltr,
                    style: Theme.of(context).textTheme.subhead,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  this.extraMenus ?? Container()
                ],
              ),
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
    if (this.children.length == 0) return Container();

    return (horizontal)
        ? buildHorizontalItems(context)
        : buildVerticalItems(context);
  }
}
