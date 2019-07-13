import 'package:flutter/material.dart';
import 'package:vocadb/ui/song_card.dart';

class Section extends StatelessWidget {

  final String title;

  final List items;

  Section({
    Key key,
    this.title,
    this.items
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
                itemCount: this.items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var s = this.items[index];
                  return SongCard(s['name'], s['artistString'], s['thumbUrl']);
                },
              ),
            ),
          ],
        ));
  }
}