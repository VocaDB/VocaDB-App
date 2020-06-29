import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vocadb/models/models.dart';

class SongListView extends StatelessWidget {
  SongListView(
      {Key key,
      this.songs,
      this.horizontal = false,
      this.displayNumber = false})
      : assert(songs != null),
        super(key: key);

  /// List of songs to display
  final List<SongModel> songs;

  /// Direction to display
  final bool horizontal;

  /// Display number order. Used for ranking list. Default is false
  final bool displayNumber;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
          itemCount: this.songs.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              SongCard.song(this.songs[index], tag: 'h')),
    );
  }
}

class SongCard extends StatelessWidget {
  final SongModel song;
  final String tag;

  SongCard.song(this.song, {this.tag});

  void navigateToSongDetail(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => navigateToSongDetail(context),
        child: Container(
          width: 130,
          margin: EdgeInsets.only(right: 8.0, left: 8.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 100,
                color: Colors.black,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Hero(
                      tag: tag,
                      child: (song.thumbUrl == null)
                          ? Placeholder()
                          : CachedNetworkImage(
                              imageUrl: song.thumbUrl,
                              placeholder: (context, url) =>
                                  Container(color: Colors.grey),
                              errorWidget: (context, url, error) =>
                                  new Icon(Icons.error),
                            )),
                ),
              ),
              Container(
                height: 4,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(song.name,
                      style: Theme.of(context).textTheme.body1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis)),
              Container(
                height: 4,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(song.artistString,
                      style: Theme.of(context).textTheme.caption,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis)),
              Container(
                height: 4,
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
      ),
    );
  }
}

class SongTypeSymbol extends StatelessWidget {
  final String songType;
  final Map types = const {
    'Original': {'text': 'O', 'backgroundColor': Colors.lightBlue},
    'Remaster': {'text': 'R', 'backgroundColor': Colors.lightBlue},
    'Remix': {'text': 'R', 'backgroundColor': Colors.grey},
    'Cover': {'text': 'C', 'backgroundColor': Colors.lightBlue},
    'Instrumental': {'text': 'I', 'backgroundColor': Colors.lightBlue},
    'Mashup': {'text': 'M', 'backgroundColor': Colors.grey},
    'MusicPV': {'text': 'M', 'backgroundColor': Colors.green},
    'DramaPV': {'text': 'M', 'backgroundColor': Colors.green},
    'Arrangement': {'text': 'A', 'backgroundColor': Colors.grey},
  };

  const SongTypeSymbol({Key key, this.songType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map st =
        types[this.songType] ?? {'text': 'O', 'backgroundColor': Colors.grey};

    return Container(
      child: Text(st['text'], style: TextStyle(color: Colors.white)),
      color: st['backgroundColor'],
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
    );
  }
}
