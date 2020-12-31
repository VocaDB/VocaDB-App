import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/src/widgets/release_event_column_view.dart';
import 'package:vocadb_app/widgets.dart';

/// Home page is same as VocaDB  website. Home page display list of highlighted songs, Recently added albums, Random popular albums and upcoming events
class HomePage extends StatelessWidget {
  void _onTapSong(SongModel songModel) {
    Get.to(SongDetailPage());
  }

  void _onTapAlbum(AlbumModel albumModel) {
    Get.to(AlbumDetailPage());
  }

  void _onTapReleaseEvent(ReleaseEventModel releaseEventModel) {
    Get.to(ReleaseEventDetailPage());
  }

  List<Widget> _generateMockChildren() {
    return [
      SpaceDivider.small(),
      Center(
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.center,
          runSpacing: 24.0,
          children: <Widget>[
            _ShortcutMenuButton(
                title: 'Songs',
                iconData: Icons.music_note,
                onPressed: () => Get.to(SongSearchPage())),
            _ShortcutMenuButton(
                title: 'Artists',
                iconData: Icons.person,
                onPressed: () => Get.to(ArtistSearchPage())),
            _ShortcutMenuButton(
                title: 'Albums',
                iconData: Icons.album,
                onPressed: () => Get.to(AlbumSearchPage())),
            _ShortcutMenuButton(
                title: 'Tags',
                iconData: Icons.label,
                onPressed: () => Get.to(TagCategoryPage())),
            _ShortcutMenuButton(
                title: 'Events',
                iconData: Icons.event,
                onPressed: () => Get.to(ReleaseEventSearchPage())),
          ],
        ),
      ),
      SpaceDivider.small(),
      Section(
        title: 'Highlight PVs',
        child: SongListView(
          scrollDirection: Axis.horizontal,
          onSelect: this._onTapSong,
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
      Section(
        title: 'Recent or upcoming albums',
        child: AlbumListView(
          scrollDirection: Axis.horizontal,
          onSelect: this._onTapAlbum,
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
      Section(
        title: 'Random popular albums',
        child: AlbumListView(
          scrollDirection: Axis.horizontal,
          onSelect: this._onTapAlbum,
          albums: [
            AlbumModel(
                id: 29432,
                name: 'Regret',
                artistString: 'Mwk, Wakuwaku Miwaku feat. 初音ミク'),
            AlbumModel(
                id: 29433, name: '#B.E.R5th', artistString: 'Various artists'),
            AlbumModel(
                id: 29412,
                name: 'NX FUTURE CORE',
                artistString: 'Various artists'),
          ],
        ),
      ),
      Section(
        title: 'Upcoming events',
        child: ReleaseEventColumnView(
          onSelect: this._onTapReleaseEvent,
          events: [
            ReleaseEventModel(
              name: 'Magical mirai 2020',
              eventCategory: 'Contest',
              mainPicture: MainPictureModel(
                  urlThumb:
                      'https://static.vocadb.net/img/releaseevent/mainOrig/1426.jpg?v=19'),
            ),
            ReleaseEventModel(
              name: 'MAIKAs Birthday 2020',
              eventCategory: 'Anniversary',
              mainPicture: MainPictureModel(
                  urlThumb:
                      'https://static.vocadb.net/img/releaseeventseries/mainOrig/206.jpg?v=4'),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = _generateMockChildren();

    return Scaffold(
      body: ListView.builder(
        itemCount: children.length,
        itemBuilder: (context, index) => children[index],
      ),
    );
  }
}

/// Shortcut menu to each entry search page on home page
class _ShortcutMenuButton extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function onPressed;

  const _ShortcutMenuButton(
      {Key key, this.title, this.iconData, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RawMaterialButton(
          onPressed: this.onPressed,
          child: Icon(
            iconData,
            color: Theme.of(context).iconTheme.color,
            size: 24.0,
          ),
          shape: CircleBorder(),
          elevation: 2.0,
          fillColor: Theme.of(context).cardColor,
          padding: const EdgeInsets.all(15.0),
        ),
        Text(title)
      ],
    );
  }
}
