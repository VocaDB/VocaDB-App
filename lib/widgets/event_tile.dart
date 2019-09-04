import 'package:flutter/material.dart';
import 'package:vocadb/pages/event_detail/event_detail_page.dart';

class EventTile extends StatelessWidget {

  final int id;

  final String imageUrl;

  final String name;

  const EventTile({Key key, this.id, this.name, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String tag = this.key.toString() + "_" + this.id.toString();

    return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EventDetailPage(thumbUrl: this.imageUrl, tag: tag)));
          },
          leading: SizedBox(
            width: 50,
            height: 50,
            child: Hero(tag: tag, child: Image.network(
              this.imageUrl,
              fit: BoxFit.fill,
            )),
          ),
          title: Text(this.name, overflow: TextOverflow.ellipsis),
        );
  }
}