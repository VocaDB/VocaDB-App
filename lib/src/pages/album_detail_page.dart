import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/widgets.dart';

class AlbumDetailPage extends StatelessWidget {
  void _onTapHome() => Get.offAll(MainPage());

  void _onTapEntrySearch() => Get.to(EntrySearchPage());

  void _onTapArtist(ArtistRoleModel artistRoleModel) =>
      Get.to(ArtistDetailPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          title: Text('Album detail'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: this._onTapEntrySearch,
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: this._onTapHome,
            )
          ],
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          SizedBox(
            width: 160,
            height: 160,
            child: CustomNetworkImage(
                'https://vocadb.net/Album/CoverPicture/79?v=22'),
          ),
          SpaceDivider.small(),
          Column(
            children: [
              Text('4.8 ★ (26)'),
              SpaceDivider.small(),
              Text(
                'アンハッピーリフレイン',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text('wowaka feat. various'),
              SpaceDivider.micro(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Original album • Released at 2020-01-01',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              )
            ],
          ),
          SpaceDivider.micro(),
          _AlbumDetailButtonBar(),
          TagGroupView(
            onPressed: (tag) => {},
            tags: [
              TagModel(name: 'alternative rock'),
              TagModel(name: 'sad'),
              TagModel(name: 'rock'),
              TagModel(name: 'remaster'),
              TagModel(name: 'electric guitar'),
              TagModel(name: 'J-rock'),
              TagModel(name: 'inner conflict'),
              TagModel(name: 'YouTube Premium')
            ],
          ),
          ExpandableContent(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextInfoSection(
                    title: 'Name',
                    text: 'ABC',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextInfoSection(
                    title: 'Description',
                    text: 'ABC description',
                  ),
                ),
                Divider(),
                ArtistGroupByRoleList.fromArtistAlbumModel(
                  onTap: this._onTapArtist,
                  artistAlbums: [
                    ArtistAlbumModel(
                        id: 661,
                        categories: 'Producer',
                        roles: 'Default',
                        name: 'wowaka',
                        artist: ArtistModel(id: 53, artistType: 'Producer')),
                    ArtistAlbumModel(
                        id: 662,
                        categories: 'Vocalist',
                        effectiveRoles: 'Default',
                        roles: 'Default',
                        name: '初音ミク',
                        artist: ArtistModel(id: 1, artistType: 'Vocaloid'))
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          TrackListView(
            tracks: [
              TrackModel(
                discNumber: 1,
                trackNumber: 1,
                name: 'アンハッピーリフレイン',
                song: SongModel(artistString: 'wowaka feat. 初音ミク'),
              ),
              TrackModel(
                discNumber: 1,
                trackNumber: 2,
                name: 'ローリンガール',
                song: SongModel(artistString: 'wowaka feat. 初音ミク'),
              ),
              TrackModel(
                discNumber: 2,
                trackNumber: 1,
                name: '裏表ラバーズ remix by キャプテンミライ',
                song: SongModel(artistString: 'キャプテンミライ feat. 初音ミク'),
              )
            ],
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
          ]),
          SpaceDivider.medium()
        ]))
      ],
    ));
  }
}

class _AlbumDetailButtonBar extends StatelessWidget {
  final VoidCallback onTapLikeButton;

  final VoidCallback onTapShareButton;

  final VoidCallback onTapInfoButton;

  const _AlbumDetailButtonBar(
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
