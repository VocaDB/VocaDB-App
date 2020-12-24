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

  void _onSelectSong(SongModel song) {}

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
              PVGroupList(pvs: [
                PVModel(
                    name: '初音ミク　オリジナル曲　「ローリンガール」',
                    url: 'https://www.nicovideo.jp/watch/sm9714351',
                    pvType: 'Original',
                    service: 'NicoNicoDouga'),
                PVModel(
                    name:
                        "wowaka 『ローリンガール』feat. 初音ミク / wowaka - Rollin Girl (Official Video) ft. Hatsune Miku",
                    url: 'https://youtu.be/vnw8zURAxkU',
                    pvType: 'Original',
                    service: 'Youtube'),
                PVModel(
                    name: "Hatsune miku - rolling girl",
                    url:
                        'http://soundcloud.com/hatsune_uke/hatsune-miku-rolling-girl',
                    pvType: 'Reprint',
                    service: 'SoundCloud'),
                PVModel(
                    name: "VOCALOID2 Hatsune Miku - ローリンガール (HD and Lyrics)",
                    url: 'https://youtu.be/XLfBdgT_esQ',
                    pvType: 'Reprint',
                    service: 'Youtube')
              ]),
              Divider(),
              Section(
                title: 'Albums',
                child: AlbumListView(
                  scrollDirection: Axis.horizontal,
                  albums: [
                    AlbumModel(
                        id: 9227,
                        name: 'THIS IS VOCAROCK',
                        artistString: '164, 203soundworks feat. various'),
                    AlbumModel(
                        id: 1590,
                        name: 'Michno-sequence',
                        artistString: 'かめりあ feat. 初音ミク, GUMI'),
                    AlbumModel(
                        id: 4986,
                        name: '東京テディベア',
                        artistString: 'Neru, おればななP feat. 鏡音リン Append (Sweet)'),
                  ],
                ),
              ),
              Divider(),
              Section(
                title: 'Alternate version',
                child: SongListView(
                  scrollDirection: Axis.horizontal,
                  onSelect: this._onSelectSong,
                  songs: [
                    SongModel(
                        id: 307335,
                        name: 'spirit photo',
                        artistString: 'Kirishima feat. Hatsune Miku',
                        thumbUrl:
                            'https://i.ytimg.com/vi/6OAd30ljny8/default.jpg',
                        songType: 'Original'),
                    SongModel(
                        id: 307325,
                        name: '天誅',
                        artistString: 'Kashii Moimi feat. Kagamine Len',
                        thumbUrl:
                            'https://nicovideo.cdn.nimg.jp/thumbnails/37974374/37974374.34231370',
                        songType: 'Original'),
                    SongModel(
                        id: 307179,
                        name: 'Running-stitch-Heartbeat',
                        artistString: 'RuupaaP feat. Hatsune Miku',
                        thumbUrl:
                            'https://nicovideo.cdn.nimg.jp/thumbnails/37971183/37971183.65149070',
                        songType: 'Original'),
                  ],
                ),
              ),
              Divider(),
              Section(
                title: 'User who liked this also liked',
                child: SongListView(
                  scrollDirection: Axis.horizontal,
                  onSelect: this._onSelectSong,
                  songs: [
                    SongModel(
                        id: 307335,
                        name: 'spirit photo',
                        artistString: 'Kirishima feat. Hatsune Miku',
                        thumbUrl:
                            'https://i.ytimg.com/vi/6OAd30ljny8/default.jpg',
                        songType: 'Original'),
                    SongModel(
                        id: 307325,
                        name: '天誅',
                        artistString: 'Kashii Moimi feat. Kagamine Len',
                        thumbUrl:
                            'https://nicovideo.cdn.nimg.jp/thumbnails/37974374/37974374.34231370',
                        songType: 'Original'),
                    SongModel(
                        id: 307179,
                        name: 'Running-stitch-Heartbeat',
                        artistString: 'RuupaaP feat. Hatsune Miku',
                        thumbUrl:
                            'https://nicovideo.cdn.nimg.jp/thumbnails/37971183/37971183.65149070',
                        songType: 'Original'),
                  ],
                ),
              ),
              Divider(),
              WebLinkGroupList(webLinks: [
                WebLinkModel(
                    description: 'NicoNicoPedia',
                    category: 'Reference',
                    url: 'https://dic.nicovideo.jp/v/sm9714351'),
                WebLinkModel(
                    category: 'Reference',
                    description: 'UtaiteDB',
                    url: 'http://utaitedb.net/S/2860'),
                WebLinkModel(
                    category: 'Official',
                    description: 'Pixiv (Illustration)',
                    url:
                        'https://www.pixiv.net/member_illust.php?mode=medium&illust_id=10324371')
              ])
            ],
          ),
        ));
  }
}
