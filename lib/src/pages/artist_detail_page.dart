import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/widgets.dart';

class ArtistDetailPage extends StatelessWidget {
  void _onSelectTag(TagModel tag) {}

  void _onTapLikeButton() {}

  void _onTapShareButton() {}

  void _onTapInfoButton() {}

  void _onTapSong(SongModel song) {}

  void _onTapArtist(ArtistRoleModel artistRoleModel) =>
      Get.to(ArtistDetailPage());

  void _onTapHome() => Get.offAll(MainPage());

  void _onTapEntrySearch() => Get.to(EntrySearchPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: _onTapEntrySearch,
              ),
              IconButton(
                icon: Icon(Icons.home),
                onPressed: _onTapHome,
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Miku'),
              background: SafeArea(
                child: Opacity(
                  opacity: 0.7,
                  child: CustomNetworkImage(
                      'https://vocadb.net/Artist/Picture/1?v=23'),
                ),
              ),
            )),
        SliverList(
            delegate: SliverChildListDelegate([
          _ArtistDetailButtonBar(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hatsune Miku',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text('初音ミク'),
                    Text('Vocaloid'),
                  ],
                ),
              ),
              SpaceDivider.small(),
              TagGroupView(
                onPressed: (tag) => {},
                tags: [
                  TagModel(name: 'green onion'),
                  TagModel(name: 'Vocaloid2'),
                  TagModel(name: 'Japanese'),
                  TagModel(name: 'feminine voicebank'),
                  TagModel(name: 'green hair'),
                  TagModel(name: 'blue hair'),
                  TagModel(name: 'absolute territory'),
                  TagModel(name: 'celebrity')
                ],
              ),
              SpaceDivider.small(),
              ExpandableContent(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextInfoSection(
                        title: 'Released',
                        text: '2007-08-31',
                      ),
                    ),
                    SpaceDivider.small(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextInfoSection(
                        title: 'Description',
                        text: 'Miku',
                      ),
                    ),
                    SpaceDivider.small(),
                    ArtistLinkListView(
                      artistLinks: [
                        ArtistLinkModel(
                            linkType: 'Group',
                            artist: ArtistModel(
                                id: 25, name: 'Crypton Future Media')),
                        ArtistLinkModel(
                            linkType: 'Illustrator',
                            artist: ArtistModel(id: 9213, name: 'KEI')),
                        ArtistLinkModel(
                            linkType: 'VoiceProvider',
                            artist: ArtistModel(id: 49761, name: '藤田咲'))
                      ],
                    )
                  ],
                ),
              ),
              Divider(),
              Section(
                title: 'Recent Songs / PVs',
                child: SongListView(
                  scrollDirection: Axis.horizontal,
                  onSelect: (s) => {},
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
                title: 'Popular songs',
                child: SongListView(
                  scrollDirection: Axis.horizontal,
                  onSelect: (s) => {},
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
                title: 'Recent or upcoming albums',
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
                title: 'Popular albums',
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
          )
        ]))
      ],
    ));
  }
}

class _ArtistDetailButtonBar extends StatelessWidget {
  final VoidCallback onTapLikeButton;

  final VoidCallback onTapShareButton;

  final VoidCallback onTapInfoButton;

  const _ArtistDetailButtonBar(
      {this.onTapLikeButton, this.onTapShareButton, this.onTapInfoButton});

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
