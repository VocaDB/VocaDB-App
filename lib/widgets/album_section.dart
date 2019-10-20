import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/widgets/album_card.dart';
import 'package:vocadb/widgets/album_tile.dart';
import 'package:vocadb/widgets/display_all.dart';
import 'package:vocadb/widgets/section.dart';

class AlbumSection extends StatelessWidget {
  final List<AlbumModel> albums;
  final String tagPrefix;

  const AlbumSection({Key key, this.albums, this.tagPrefix}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (albums.length == 0) {
      return Container();
    }

    if (albums.length > 10) {
      return Column(
        children: <Widget>[
          Section(
            title: FlutterI18n.translate(context, 'label.albums'),
            horizontal: true,
            children: albums
                .take(10)
                .map(
                    (a) => AlbumCard.album(a, tag: '${this.tagPrefix}_${a.id}'))
                .toList(),
            extraMenus: PopupMenuButton<String>(
              icon: Icon(Icons.more_horiz),
              onSelected: (String selectedValue) {
                DisplayAll.navigate(
                    context,
                    'More albums',
                    albums
                        .map((a) => AlbumTile.fromEntry(a,
                            tag: '${this.tagPrefix}_${a.id}'))
                        .toList());
              },
              itemBuilder: (BuildContext context) => [
                PopupMenuItem<String>(
                  value: 'more',
                  child: Text(FlutterI18n.translate(context, 'label.showMore')),
                ),
              ],
            ),
          ),
          Divider(),
        ],
      );
    }

    return Column(
      children: <Widget>[
        Section(
          title: FlutterI18n.translate(context, 'label.albums'),
          horizontal: true,
          children: albums
              .map((a) => AlbumCard.album(a, tag: '${this.tagPrefix}_${a.id}'))
              .toList(),
        ),
        Divider(),
      ],
    );
  }
}
