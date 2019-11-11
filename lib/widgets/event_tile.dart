import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/models/release_event_model.dart';
import 'package:vocadb/pages/event_detail/event_detail_page.dart';

class EventTile extends StatelessWidget {
  final int id;

  final String imageUrl;

  final String name;

  final String category;

  final String date;

  final String tag;

  const EventTile(
      {Key key,
      this.id,
      this.name,
      this.date,
      this.category,
      this.imageUrl,
      this.tag})
      : super(key: key);

  EventTile.fromEntry(EntryModel entry, {this.tag})
      : this.id = entry.id,
        this.imageUrl = entry.imageUrl,
        this.name = entry.name,
        this.date = entry.activityDateFormatted,
        this.category = entry.eventCategory;

  EventTile.fromReleaseEvent(ReleaseEventModel releaseEvent, {this.tag})
      : this.id = releaseEvent.id,
        this.imageUrl = releaseEvent.imageUrl,
        this.name = releaseEvent.name,
        this.date = releaseEvent.dateFormatted,
        this.category = releaseEvent.category;

  void navigateToDetail(BuildContext context) {
    ReleaseEventDetailScreen.navigate(context, id,
        name: this.name, thumbUrl: this.imageUrl, tag: this.tag);
  }

  @override
  Widget build(BuildContext context) {
    String categoryName =
        FlutterI18n.translate(context, 'eventCategory.$category');
    return ListTile(
      onTap: () => navigateToDetail(context),
      leading: SizedBox(
        width: 50,
        height: 50,
        child: Hero(
            tag: tag,
            child: CachedNetworkImage(
              imageUrl: this.imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(color: Colors.grey),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            )),
      ),
      title: Text(this.name, overflow: TextOverflow.ellipsis),
      subtitle: Text('$categoryName • $date'),
    );
  }
}
