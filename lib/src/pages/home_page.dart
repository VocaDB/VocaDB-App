import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/widgets.dart';

/// Home page is same as VocaDB  website. Home page display list of highlighted songs, Recently added albums, Random popular albums and upcoming events
class HomePage extends GetView<HomePageController> {
  void _onTapSong(SongModel songModel) {
    Get.to(SongDetailPage());
  }

  void _onTapAlbum(AlbumModel albumModel) {
    Get.to(AlbumDetailPage());
  }

  void _onTapReleaseEvent(ReleaseEventModel releaseEventModel) {
    Get.to(ReleaseEventDetailPage());
  }

  List<Widget> _generateChildren() {
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
        title: 'Highlighted',
        child: Obx(() => SongListView(
              displayPlaceholder: controller.highlighted.isEmpty,
              scrollDirection: Axis.horizontal,
              onSelect: this._onTapSong,
              songs: controller.highlighted.toList(),
            )),
      ),
      Section(
        title: 'Recent or upcoming albums',
        child: Obx(() => AlbumListView(
              displayPlaceholder: controller.recentAlbums.isEmpty,
              scrollDirection: Axis.horizontal,
              onSelect: this._onTapAlbum,
              albums: controller.recentAlbums.toList(),
            )),
      ),
      Section(
        title: 'Random popular albums',
        child: Obx(() => AlbumListView(
              displayPlaceholder: controller.randomAlbums.isEmpty,
              scrollDirection: Axis.horizontal,
              onSelect: this._onTapAlbum,
              albums: controller.randomAlbums.toList(),
            )),
      ),
      Section(
        title: 'Upcoming events',
        child: Obx(() => ReleaseEventColumnView(
              onSelect: this._onTapReleaseEvent,
              events: controller.recentReleaseEvents.toList(),
            )),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = _generateChildren();

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
