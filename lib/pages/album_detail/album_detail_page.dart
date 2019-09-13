import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vocadb/models/album.dart';
import 'package:vocadb/services/web_service.dart';
import 'package:vocadb/widgets/space_divider.dart';
import 'package:vocadb/widgets/tags.dart';
import "package:collection/collection.dart";
import 'package:vocadb/widgets/track.dart';

class AlbumDetailPage extends StatelessWidget {
  final int id;
  final String name;
  final String thumbUrl;
  final String tag;

  const AlbumDetailPage({Key key, this.id, this.name, this.thumbUrl, this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.name)),
      body: CustomScrollView(
        slivers: <Widget>[
          HeroContent(this.thumbUrl, this.tag),
          AlbumDetailContent(this.id),
        ],
      ),
    );
  }
}

class AlbumDetailContent extends StatefulWidget {
  final int id;

  const AlbumDetailContent(this.id);

  @override
  _AlbumDetailContentState createState() => _AlbumDetailContentState();
}

class _AlbumDetailContentState extends State<AlbumDetailContent> {
  List<Widget> tracks;

  @override
  void initState() {
    super.initState();

    var groupTracks = groupBy(rawTracks, (t) => t["discNumber"]);

    this.tracks = List();

    groupTracks.forEach(initialTracksByDisc);
  }

  void initialTracksByDisc(disc, List<Map<String, Object>> tracks) {
    this.tracks.add(Text('Disc $disc'));

    var discTracks = tracks.map((t) => Track.parseMap(t)).toList();

    this.tracks.addAll(discTracks);
    this.tracks.add(SpaceDivider());
  }

  buildHasData(Album album) {
    return SliverList(
      delegate: SliverChildListDelegate.fixed(detailWidgets(album)),
    );
  }

  buildError() {
    return SliverFillRemaining(
      child: Center(
        child: Text('Error...'),
      ),
    );
  }

  buildDefault() {
    return SliverFillRemaining();
  }

  List<Widget> detailWidgets(Album album) {
    return [
      SpaceDivider(),
      Tags(),
      SpaceDivider(),
      Container(
          child: Column(
        children: tracks,
      ))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Album>(
      future: WebService().load(Album.byId(widget.id)),
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return buildHasData(snapshot.data);
        else if (snapshot.hasError) return buildError();

        return buildDefault();
      },
    );
  }
}

class HeroContent extends StatelessWidget {
  final String thumbUrl;
  final String tag;

  const HeroContent(String thumbUrl, String tag)
      : this.tag = tag,
        this.thumbUrl = thumbUrl;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(16.0),
      sliver: SliverToBoxAdapter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 160,
                height: 160,
                child: Hero(
                    tag: this.tag,
                    child: CachedNetworkImage(
                      imageUrl: this.thumbUrl,
                      placeholder: (context, url) =>
                          Container(color: Colors.grey),
                      errorWidget: (context, url, error) =>
                          new Icon(Icons.error),
                    )))
          ],
        ),
      ),
    );
  }
}

const rawTracks = [
  {
    "discNumber": 1,
    "id": 8776,
    "name": "Tell Your World",
    "song": {
      "artistString": "kz feat. 初音ミク",
      "createDate": "2012-01-14T17:36:16",
      "defaultName": "Tell Your World",
      "defaultNameLanguage": "English",
      "favoritedTimes": 90,
      "id": 8395,
      "lengthSeconds": 257,
      "name": "Tell Your World",
      "publishDate": "2012-03-12T00:00:00Z",
      "pvServices": "Youtube, SoundCloud",
      "ratingScore": 456,
      "songType": "Original",
      "status": "Approved",
      "version": 26
    },
    "trackNumber": 1
  },
  {
    "discNumber": 1,
    "id": 8780,
    "name": "Far Away",
    "song": {
      "artistString": "kz feat. 初音ミク",
      "createDate": "2012-01-14T17:38:09",
      "defaultName": "Far Away",
      "defaultNameLanguage": "English",
      "favoritedTimes": 7,
      "id": 8396,
      "lengthSeconds": 308,
      "name": "Far Away",
      "publishDate": "2012-03-14T00:00:00Z",
      "pvServices": "Youtube",
      "ratingScore": 31,
      "songType": "Original",
      "status": "Finished",
      "version": 9
    },
    "trackNumber": 2
  },
  {
    "discNumber": 1,
    "id": 8781,
    "name": "Star Story",
    "song": {
      "artistString": "kz feat. 初音ミク",
      "createDate": "2012-01-14T17:38:09",
      "defaultName": "Star Story",
      "defaultNameLanguage": "English",
      "favoritedTimes": 14,
      "id": 8397,
      "lengthSeconds": 286,
      "name": "Star Story",
      "publishDate": "2012-03-14T00:00:00Z",
      "pvServices": "Youtube",
      "ratingScore": 66,
      "songType": "Original",
      "status": "Finished",
      "version": 10
    },
    "trackNumber": 3
  },
  {
    "discNumber": 1,
    "id": 10119,
    "name": "Half Step",
    "song": {
      "artistString": "kz feat. 初音ミク",
      "createDate": "2012-03-13T19:18:09",
      "defaultName": "Half Step",
      "defaultNameLanguage": "English",
      "favoritedTimes": 6,
      "id": 10020,
      "lengthSeconds": 254,
      "name": "Half Step",
      "publishDate": "2012-03-14T00:00:00Z",
      "pvServices": "Youtube",
      "ratingScore": 20,
      "songType": "Original",
      "status": "Finished",
      "version": 6
    },
    "trackNumber": 4
  },
  {
    "discNumber": 1,
    "id": 8777,
    "name": "Fly Out",
    "song": {
      "artistString": "kz feat. 初音ミク",
      "createDate": "2011-11-24T19:08:40",
      "defaultName": "Fly Out",
      "defaultNameLanguage": "English",
      "favoritedTimes": 5,
      "id": 4137,
      "lengthSeconds": 277,
      "name": "Fly Out",
      "publishDate": "2012-03-13T00:00:00Z",
      "pvServices": "Youtube",
      "ratingScore": 31,
      "songType": "Original",
      "status": "Finished",
      "version": 9
    },
    "trackNumber": 5
  },
  {
    "discNumber": 1,
    "id": 10120,
    "name": "ジュビリー",
    "song": {
      "artistString": "kz feat. 初音ミク",
      "createDate": "2012-03-13T19:18:09",
      "defaultName": "��ュビリー",
      "defaultNameLanguage": "Japanese",
      "favoritedTimes": 4,
      "id": 10021,
      "lengthSeconds": 374,
      "name": "ジュビリー",
      "publishDate": "2012-03-14T00:00:00Z",
      "pvServices": "Youtube",
      "ratingScore": 14,
      "songType": "Original",
      "status": "Finished",
      "version": 8
    },
    "trackNumber": 6
  },
  {
    "discNumber": 1,
    "id": 10121,
    "name": "Tell Your World (Panda BoY Remix)",
    "song": {
      "artistString": "PandaBoY feat. 初音ミク",
      "createDate": "2012-03-13T19:18:09",
      "defaultName": "Tell Your World (Panda BoY Remix)",
      "defaultNameLanguage": "English",
      "favoritedTimes": 4,
      "id": 10022,
      "lengthSeconds": 271,
      "name": "Tell Your World (Panda BoY Remix)",
      "originalVersionId": 8395,
      "publishDate": "2012-03-14T00:00:00Z",
      "pvServices": "Youtube",
      "ratingScore": 14,
      "songType": "Remix",
      "status": "Finished",
      "version": 8
    },
    "trackNumber": 7
  },
  {
    "discNumber": 1,
    "id": 10122,
    "name": "Tell Your World (open the scenery rmx by  fu_mou)",
    "song": {
      "artistString": "fu_mou feat. 初音ミク",
      "createDate": "2012-03-13T19:18:09",
      "defaultName": "Tell Your World (open the scenery rmx by  fu_mou)",
      "defaultNameLanguage": "English",
      "favoritedTimes": 0,
      "id": 10023,
      "lengthSeconds": 305,
      "name": "Tell Your World (open the scenery rmx by  fu_mou)",
      "originalVersionId": 8395,
      "publishDate": "2012-03-14T00:00:00Z",
      "pvServices": "Youtube",
      "ratingScore": 6,
      "songType": "Remix",
      "status": "Finished",
      "version": 7
    },
    "trackNumber": 8
  },
  {
    "discNumber": 2,
    "id": 51783,
    "name": "Tell Your World",
    "song": {
      "artistString": "kz feat. 初音ミク",
      "createDate": "2012-01-14T17:36:16",
      "defaultName": "Tell Your World",
      "defaultNameLanguage": "English",
      "favoritedTimes": 90,
      "id": 8395,
      "lengthSeconds": 257,
      "name": "Tell Your World",
      "publishDate": "2012-03-12T00:00:00Z",
      "pvServices": "Youtube, SoundCloud",
      "ratingScore": 456,
      "songType": "Original",
      "status": "Approved",
      "version": 26
    },
    "trackNumber": 1
  }
];
