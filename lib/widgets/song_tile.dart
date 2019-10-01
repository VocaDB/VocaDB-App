import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/pages/song_detail/song_detail_page.dart';
import 'package:vocadb/widgets/song_type_symbol.dart';

class SongTile extends StatelessWidget {
  final Widget leading;
  final SongModel song;
  final String tag;

  SongTile.fromSong(this.song, {this.leading, this.tag});

  factory SongTile.fromEntry(EntryModel entryModel,
      {Widget leading, String tag}) {
    SongModel song = SongModel();
    song.id = entryModel.id;
    song.songType = entryModel.songType;
    song.name = entryModel.name;
    song.artistString = entryModel.artistString;
    song.thumbUrl = entryModel.imageUrl;

    return SongTile.fromSong(song, leading: leading, tag: tag);
  }

  Widget leadingWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: this.leading,
    );
  }

  Widget thumbnailWidget() {
    Widget thumbnail = (song.thumbUrl != null && song.thumbUrl.isNotEmpty)
        ? CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: song.thumbUrl,
            placeholder: (context, url) => Container(color: Colors.grey),
            errorWidget: (context, url, error) => new Icon(Icons.error),
          )
        : Placeholder();

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 120,
          child: thumbnail,
        ));
  }

  Widget infoWidget(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(song.name, overflow: TextOverflow.ellipsis),
            Text(song.artistString,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.caption),
            SizedBox(
              height: 8.0,
            ),
            Row(
              children: <Widget>[
                SongTypeSymbol(
                  songType: song.songType,
                ),
                (song.youtubePV != null)
                    ? Icon(Icons.local_movies)
                    : Container()
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget trailing() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
    );
  }

  void navigateToSongDetail(BuildContext context) {
    Navigator.pushNamed(context, SongDetailScreen.routeName,
        arguments: SongDetailScreenArguments(song.id, song.name,
            thumbUrl: song.thumbUrl, tag: tag));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateToSongDetail(context),
      child: Container(
        height: 100,
        child: Row(
          children: <Widget>[
            (this.leading == null) ? Container() : leadingWidget(),
            thumbnailWidget(),
            infoWidget(context),
          ],
        ),
      ),
    );
  }
}
