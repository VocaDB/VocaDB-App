import 'package:flutter/material.dart';
import 'package:vocadb/ui/action_bar.dart';
import 'package:vocadb/ui/action_button.dart';
import 'package:vocadb/ui/like_action_button.dart';
import 'package:vocadb/ui/share_action_button.dart';
import 'package:vocadb/ui/source_action_button.dart';
import "package:collection/collection.dart";

class AlbumDetailPage extends StatefulWidget {

  final String thumbUrl;

  final String tag;

  const AlbumDetailPage({Key key, this.thumbUrl, this.tag}) : super(key: key);

  @override
  _AlbumDetailPageState createState() => _AlbumDetailPageState();
}

class _AlbumDetailPageState extends State<AlbumDetailPage> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        // The blue background emphasizes that it's a new route.
        alignment: Alignment.topLeft,
        child: ListView(
          children: <Widget>[
            HeroContent(tag: widget.tag, thumbUrl: widget.thumbUrl),

            Container(
              child: Column(
                children: <Widget>[
                  Text('Tell your world', style: Theme.of(context).textTheme.title),
                  Text('kz(livetune)')
                ],
              ),
            ),

          SpaceDivider(),

            ActionBar(
                actions: <ActionButton> [
                  LikeActionButton(),
                  ShareActionButton(),
                  SourceActionButton(),
                ]
            ),

            SpaceDivider(),

            Container(
              child: Column(
                children: tracks,
              )
            )
          ],
        ),
      ),
    );
  }
}

class SpaceDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16,
    );
  }
}


class Track extends StatelessWidget {

  final int trackNumber;

  final String name;

  final String artist;

  const Track({Key key, this.trackNumber, this.name, this.artist}): super(key: key);

  factory Track.parseMap(Map<String, Object> map, {Key key}) {
    return Track(key: key, trackNumber: map['trackNumber'], name: map['name'], artist: 'Unknown artist');
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Text(this.trackNumber.toString()),
        title: Text(
            this.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis
        ),
        subtitle: Text(this.artist, maxLines: 1, overflow: TextOverflow.ellipsis),
    );
  }
}


class HeroContent extends StatelessWidget {

  final String tag;

  final String thumbUrl;

  const HeroContent({Key key, this.tag, this.thumbUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: this.tag,
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: SizedBox(
          width: 300,
          height: 150,
          child: Image.network(
            this.thumbUrl,
            fit: BoxFit.contain,
          ),
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
      "defaultName": "ジュビリー",
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
