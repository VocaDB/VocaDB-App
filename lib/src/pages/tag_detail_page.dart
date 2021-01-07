import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/routes.dart';
import 'package:vocadb_app/widgets.dart';

class TagDetailPage extends StatelessWidget {
  void _onSelectTag(TagModel tag) {}

  void _onTapShareButton() {}

  void _onTapInfoButton() {}

  void _onTapSong(SongModel song) => AppPages.toSongDetailPage(song);

  void _onTapArtist(ArtistModel artist) => AppPages.toArtistDetailPage(artist);

  void _onTapAlbum(AlbumModel album) => AppPages.toAlbumDetailPage(album);

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
                '#Lat式ミク',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              background: SafeArea(
                child: Opacity(
                  opacity: 0.7,
                  child: CustomNetworkImage(
                    'https://static.vocadb.net/img/tag/mainOrig/231.jpg?v=7',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )),
        SliverList(
            delegate: SliverChildListDelegate([
          _TagDetailButtonBar(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextInfoSection(
                title: 'Name',
                text: 'Lat式ミク',
              ),
              SpaceDivider.small(),
              TextInfoSection(
                title: 'Category',
                text: 'Animation',
              ),
              SpaceDivider.small(),
              InfoSection(
                  title: 'Parent',
                  child: Tag(
                    label: 'LAT',
                    onPressed: () => this._onSelectTag(TagModel(name: 'LAT')),
                  )),
              SpaceDivider.small(),
              TextInfoSection(
                title: 'Description',
                text:
                    'A song contest for Magical Mirai 2017. The main prize was getting your song played at the concert.',
              ),
              Divider(),
              Section(
                title: 'Top artists',
                child: ArtistColumnView(
                  artists: [
                    ArtistModel(id: 1, name: 'Miku'),
                    ArtistModel(id: 2, name: 'Luka')
                  ],
                ),
              ),
              Divider(),
              Section(
                title: 'Top songs',
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
                title: 'Top albums',
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

class _TagDetailButtonBar extends StatelessWidget {
  final VoidCallback onTapShareButton;

  final VoidCallback onTapInfoButton;

  const _TagDetailButtonBar({this.onTapShareButton, this.onTapInfoButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
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
