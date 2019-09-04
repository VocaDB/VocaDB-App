import 'package:flutter/material.dart';
import 'package:vocadb/pages/tag_detail/tag_detail_page.dart';

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
            child: InputChip(
              label: Text('#electropop'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TagDetailPage()));
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 4.0),
            child: InputChip(
              label: Text('#MMD'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TagDetailPage()));
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 4.0),
            child: InputChip(
              onPressed: () {},
              label: Text('More (18)'),
            ),
          ),
        ],
      ),
    );
  }
}
