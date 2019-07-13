import 'package:flutter/material.dart';

class PVListItem extends StatelessWidget {

  final String title;

  const PVListItem({
    Key key,
    this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      child: Row(
        children: <Widget>[
          Container(
            child: Icon(Icons.ondemand_video),
          ),
          Expanded(
            child: Padding(
                padding: EdgeInsets.only(right: 8.0, left: 8.0),
                child: Text(this.title, maxLines: 2, overflow: TextOverflow.ellipsis)
            ),
          ),
          Container(
              child: Icon(Icons.more_vert)
          )
        ],
      ),
    );
  }
}