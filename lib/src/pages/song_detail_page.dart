import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/utils.dart';
import 'package:vocadb_app/widgets.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SongDetailPage extends StatefulWidget {
  @override
  _SongDetailPageState createState() => _SongDetailPageState();
}

class _SongDetailPageState extends State<SongDetailPage> {
  YoutubePlayerController _controller;

  bool showLyric = false;

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

  void _onTapLyricButton() {
    setState(() {
      showLyric = true;
    });
  }

  void _onTapShareButton() {}

  void _onTapInfoButton() {}

  void _onSelectSong(SongModel song) {}

  void _onTapArtist(ArtistRoleModel artistRoleModel) {
    Get.to(ArtistDetailPage());
  }

  void _onTapCloseLyricContent() {
    setState(() {
      showLyric = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Song detail'),
          actions: [
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () => Get.to(EntrySearchPage())),
            IconButton(
                icon: Icon(Icons.home), onPressed: () => Get.offAll(MainPage()))
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Column(
            children: [
              YoutubePlayer(
                controller: _controller,
                onReady: () {
                  _controller.addListener(() => {});
                },
              ),
              (showLyric) ? _buildLyricContent() : _buildSongDetailContent()
            ],
          ),
        ));
  }

  Widget _buildLyricContent() {
    return Expanded(
      child: LyricContent(
        lyrics: [
          LyricModel(
              id: 97,
              translationType: 'Original',
              cultureCode: 'ja',
              value:
                  'ロンリーガールはいつまでも　届かない夢見て \r\n騒ぐ頭の中を掻き回して、掻き回して。\r\n\r\n「問題ない。」と呟いて、言葉は失われた？ \r\nもう失敗、もう失敗。 \r\n間違い探しに終われば、また、回るの！\r\n\r\nもう一回、もう一回。 \r\n「私は今日も転がります。」と、 \r\n少女は言う　少女は言う \r\n言葉に意味を奏でながら！\r\n\r\n「もう良いかい？」 \r\n「まだですよ、まだまだ先は見えないので。息を 止\r\nと\r\nめるの、今。」\r\n\r\nローリンガールの成れの果て　届かない、向こうの色 \r\n重なる声と声を混ぜあわせて、混ぜあわせて。\r\n\r\n「問題ない。」と呟いた言葉は失われた。 \r\nどうなったって良いんだってさ、 \r\n間違いだって起こしちゃおうと誘う、坂道。\r\n\r\nもう一回、もう一回。 \r\n私をどうか転がしてと \r\n少女は言う　少女は言う \r\n無口に意味を重ねながら！\r\n\r\n「もう良いかい？」 \r\n「もう少し、もうすぐ何か見えるだろうと。息を 止\r\nと\r\nめるの、今。」\r\n\r\nもう一回、もう一回。 \r\n「私は今日も転がります。」と、 \r\n少女は言う　少女は言う \r\n言葉に笑みを奏でながら！\r\n\r\n「もう良いかい？もう良いよ。そろそろ君も疲れたろう、ね。」\r\n\r\n息を 止\r\nや\r\nめるの、今。'),
          LyricModel(
              id: 98,
              translationType: 'Romanized',
              cultureCode: '',
              value:
                  'RONRII GAARU wa itsu made mo todoka nai yume mite\r\nsawagu atama no naka o kaki mawashite, kaki mawashite\r\n\r\n\"mondai nai\" to tsubuyaite, kotoba wa ushinawareta?\r\n\r\nmou shippai, mou shippai\r\nmachigai sagashi ni owareba, mata, mawaru no!\r\n\r\nmou ikai, mou ikai\r\n\"watashi wa kyou mo korogari masu\" to\r\nshoujo wa iu shoujo wa iu\r\nkotoba ni imi o kanade nagara!\r\n\r\n\"mou ii kai?\"\r\n\"mada desu yo, madamada saki wa mie nai node. iki o tomeru no, ima\"\r\n\r\nROORIN GAARU no narenohate todoka nai, mukou no iro\r\nkasanaru koe to koe o maze awasete, maze awasete\r\n\r\n\"mondai nai\" to tsubuyai ta kotoba wa ushinawareta\r\ndounattatte yoi n datte sa\r\nmachigai datte okoshi chaou to sasou, sakamichi\r\n\r\nmou ikai, mou ikai \r\nwatashi o douka korogashite to\r\nshoujo wa iu shoujo wa iu\r\nmukuchi ni imi o kasane nagara!\r\n\r\n\"mou ii kai?\"\r\n\"mousukoshi, mousugu nani ka mieru daro u to. iki o tomeru no, ima\"\r\n\r\nmou ikai, mou ikai \r\n\"watashi wa kyou mo korogari masu\" to\r\nshoujo wa iu shoujo wa iu\r\nkotoba ni imi o kanade nagara!\r\n\r\n\"mou ii kai? mou ii yo. sorosoro kimi mo tsukare ta rou, ne\"\r\niki o yameru no, ima'),
          LyricModel(
              id: 99,
              translationType: 'Translation',
              cultureCode: 'en',
              value:
                  "For lonely girls, it's always the same, dreaming dreams that don't come true\nAnd churning, churning through the clamor in their heads\n\nA lonely girl mutters \"I'm fine\", have words failed her?\nA failure, a failure.\nObsessing over her mistakes makes everything spin again!\n\nOne more time, one more time\n\"I'll roll along again today\"\nThe girl said, the girl said\nBreathing life into the words!\n\n\"How about now?\"\n\n\"Not yet, we still can't see what's ahead. Hold your breath, now.\"\n\nThis is how it ends for a Rolling Girl, unable to reach the colors on the other side\nThe overlapping voices, they blend together, blend together\n\nShe mutters, \"I'm fine.\", but the words fail her\nNot caring how it ends\nAn upward climb that invites mistakes\n\nOne more time, one more time\nPlease, get me rolling\nThe girl said, the girl said\nWith her intense silence!\n\n\"How about now?\"\n\n\"Just a little more, we should see something soon. Hold your breath, now.\"\n\nOne more time, one more time\n\"I'll roll along again today\"\nThe girl said, the girl said\nBreathing laughter into the words!\n\n\"How about now? OK, you can look. You must be exhausted too, right?\"\n\nStop breathing, now.")
        ],
        onTapClose: this._onTapCloseLyricContent,
      ),
    );
  }

  Widget _buildSongDetailContent() {
    return Expanded(
      child: ListView(
        children: [
          _SongDetailButtonBar(
            onTapLikeButton: this._onTapLikeButton,
            onTapLyricButton: this._onTapLyricButton,
            onTapShareButton: this._onTapShareButton,
            onTapInfoButton: this._onTapInfoButton,
          ),
          _SongDetailInfo(
            name: 'ローリンガール',
            additionalNames: "Rolling Girl, Rollin' Girl",
            songType: 'Original',
            publishedDate: DateTime(2011, 11, 1),
          ),
          SpaceDivider.small(),
          TagGroupView(
            onPressed: this._onSelectTag,
            tags: [
              TagModel(name: 'alternative rock'),
              TagModel(name: 'piano'),
              TagModel(name: 'melancholic'),
              TagModel(name: 'Project DIVA'),
              TagModel(name: 'Project DIVA Arcade'),
              TagModel(name: 'sad'),
              TagModel(name: 'suicide'),
              TagModel(name: 'piano-rock')
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
                    thumbUrl: 'https://i.ytimg.com/vi/6OAd30ljny8/default.jpg',
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
                    thumbUrl: 'https://i.ytimg.com/vi/6OAd30ljny8/default.jpg',
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
    );
  }
}

class _SongDetailInfo extends StatelessWidget {
  final String name;

  final String additionalNames;

  final String songType;

  final DateTime publishedDate;

  const _SongDetailInfo(
      {this.name, this.additionalNames, this.songType, this.publishedDate});

  String _stringPublishedDate() {
    return (this.publishedDate == null)
        ? ''
        : ' • Published on ${DateTimeUtils.toSimpleFormat(this.publishedDate)}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(this.name, style: Theme.of(context).textTheme.headline6),
          Text(this.additionalNames),
          SpaceDivider.micro(),
          Text('$songType${_stringPublishedDate()}'),
        ],
      ),
    );
  }
}

class _SongDetailButtonBar extends StatelessWidget {
  final VoidCallback onTapLikeButton;

  final VoidCallback onTapLyricButton;

  final VoidCallback onTapShareButton;

  final VoidCallback onTapInfoButton;

  const _SongDetailButtonBar(
      {this.onTapLikeButton,
      this.onTapLyricButton,
      this.onTapShareButton,
      this.onTapInfoButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: FlatButton(
              onPressed: this.onTapLikeButton,
              child: Column(
                children: [Icon(Icons.favorite), Text('Like')],
              ),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: this.onTapLyricButton,
              child: Column(
                children: [Icon(Icons.subtitles), Text('Lyric')],
              ),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: this.onTapShareButton,
              child: Column(
                children: [Icon(Icons.share), Text('Share')],
              ),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: this.onTapInfoButton,
              child: Column(
                children: [Icon(Icons.info), Text('Info')],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
