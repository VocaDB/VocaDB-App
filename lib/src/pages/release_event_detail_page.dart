import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/routes.dart';
import 'package:vocadb_app/widgets.dart';

class ReleaseEventDetailPage extends StatelessWidget {
  void _onSelectTag(TagModel tag) => AppPages.toTagDetailPage(tag);

  void _onTapLikeButton() {}

  void _onTapShareButton() {}

  void _onTapInfoButton() {}

  void _onTapSong(SongModel song) => AppPages.toSongDetailPage(song);

  void _onTapArtist(ArtistRoleModel a) =>
      AppPages.toArtistDetailPage(ArtistModel(
          id: a.id,
          name: a.name,
          mainPicture: MainPictureModel(urlThumb: a.imageUrl)));

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
              title: Text(
                '「マジカルミライ」楽曲コンテスト 2017',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              background: SafeArea(
                child: Opacity(
                  opacity: 0.7,
                  child: CustomNetworkImage(
                    'https://static.vocadb.net/img/releaseevent/mainOrig/1426.jpg?v=1',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )),
        SliverList(
            delegate: SliverChildListDelegate([
          _ReleaseEventDetailButtonBar(),
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
                  TagModel(name: 'マジカルミライ'),
                ],
              ),
              SpaceDivider.small(),
              TextInfoSection(
                title: 'Name',
                text: '「マジカルミライ」楽曲コンテスト 2017',
              ),
              SpaceDivider.small(),
              TextInfoSection(
                title: 'Category',
                text: 'Contest',
              ),
              SpaceDivider.small(),
              TextInfoSection(
                title: 'Date',
                text: '2017-02-03',
              ),
              SpaceDivider.small(),
              TextInfoSection(
                title: 'Venue',
                text: 'Somewhere',
              ),
              SpaceDivider.small(),
              TextInfoSection(
                title: 'Description',
                text:
                    'A song contest for Magical Mirai 2017. The main prize was getting your song played at the concert.',
              ),
              Divider(),
              Section(
                title: 'Participating artists',
                child: ArtistColumnView(
                  artists: [
                    ArtistModel(id: 1, name: 'Miku'),
                    ArtistModel(id: 2, name: 'Luka')
                  ],
                ),
              ),
              Divider(),
              Section(
                title: 'Songs',
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
                title: 'Series',
                child: ReleaseEventSeriesTile(
                  name: '「マジカルミライ」楽曲コンテスト',
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

class _ReleaseEventDetailButtonBar extends StatelessWidget {
  final VoidCallback onTapLikeButton;

  final VoidCallback onTapMapButton;

  final VoidCallback onTapInfoButton;

  const _ReleaseEventDetailButtonBar(
      {this.onTapLikeButton, this.onTapMapButton, this.onTapInfoButton});

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
              onPressed: this.onTapMapButton,
              child: Column(
                children: [Icon(Icons.place), Text('Map')],
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
