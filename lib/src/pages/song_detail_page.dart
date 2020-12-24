import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/widgets.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SongDetailPage extends StatefulWidget {
  @override
  _SongDetailPageState createState() => _SongDetailPageState();
}

class _SongDetailPageState extends State<SongDetailPage> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'vnw8zURAxkU',
      flags: YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  void _onSelectTag(TagModel tag) {}

  void _onTapLikeButton() {}

  void _onTapLyricButton() {}

  void _onTapShareButton() {}

  void _onTapInfoButton() {}

  void _onTapArtist(ArtistRoleModel artistRoleModel) {
    Get.to(ArtistDetailPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Song detail')),
        body: Container(
          padding: EdgeInsets.only(bottom: 16.0),
          child: ListView(
            children: [
              YoutubePlayer(
                controller: _controller,
                onReady: () {
                  _controller.addListener(() => {});
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: FlatButton(
                        onPressed: this._onTapLikeButton,
                        child: Column(
                          children: [Icon(Icons.favorite), Text('Like')],
                        ),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        onPressed: this._onTapLyricButton,
                        child: Column(
                          children: [Icon(Icons.subtitles), Text('Lyric')],
                        ),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        onPressed: this._onTapShareButton,
                        child: Column(
                          children: [Icon(Icons.share), Text('Share')],
                        ),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        onPressed: this._onTapInfoButton,
                        child: Column(
                          children: [Icon(Icons.info), Text('Info')],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ローリンガール',
                        style: Theme.of(context).textTheme.headline6),
                    Text("Rolling Girl, Rollin' Girl"),
                    SpaceDivider.micro(),
                    Text('Original • Published on 2011-11-01'),
                  ],
                ),
              ),
              SpaceDivider.small(),
              TagGroupView(
                onPressed: this._onSelectTag,
                tags: [
                  TagModel(name: 'alternative rock'),
                  TagModel(name: 'piano')
                ],
              ),
              Divider(),
              ArtistGroupByRoleList.fromArtistSongModel(
                onTap: this._onTapArtist,
                artistSongs: [
                  ArtistSongModel(
                      id: 661,
                      categories: 'Producer',
                      roles: 'Default',
                      name: 'wowaka',
                      artist: ArtistModel(id: 53, artistType: 'Producer')),
                  ArtistSongModel(
                      id: 662,
                      categories: 'Vocalist',
                      effectiveRoles: 'Default',
                      roles: 'Default',
                      name: '初音ミク',
                      artist: ArtistModel(id: 1, artistType: 'Vocaloid'))
                ],
              ),
              Divider(),
            ],
          ),
        ));
  }
}
