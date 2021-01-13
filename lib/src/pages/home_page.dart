import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/routes.dart';
import 'package:vocadb_app/widgets.dart';

/// Home page is same as VocaDB  website. Home page display list of highlighted songs, Recently added albums, Random popular albums and upcoming events
class HomePage extends GetView<HomePageController> {
  void _onTapSong(SongModel song) => AppPages.toSongDetailPage(song);

  void _onTapAlbum(AlbumModel album) => AppPages.toAlbumDetailPage(album);

  void _onTapReleaseEvent(ReleaseEventModel releaseEventModel) =>
      AppPages.toReleaseEventDetailPage(releaseEventModel);

  void _onTapSongSearchIcon() => Get.toNamed(Routes.SONGS);

  void _onTapArtistSearchIcon() => Get.toNamed(Routes.ARTISTS);

  void _onTapAlbumSearchIcon() => Get.toNamed(Routes.ALBUMS);

  void _onTapTagSearchIcon() => Get.toNamed(Routes.TAG_CATEGORIES);

  void _onTapEventSearchIcon() => Get.toNamed(Routes.RELEASE_EVENTS);

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
                title: 'songs'.tr,
                iconData: Icons.music_note,
                onPressed: this._onTapSongSearchIcon),
            _ShortcutMenuButton(
                title: 'artists'.tr,
                iconData: Icons.person,
                onPressed: this._onTapArtistSearchIcon),
            _ShortcutMenuButton(
                title: 'albums'.tr,
                iconData: Icons.album,
                onPressed: this._onTapAlbumSearchIcon),
            _ShortcutMenuButton(
                title: 'tags'.tr,
                iconData: Icons.label,
                onPressed: this._onTapTagSearchIcon),
            _ShortcutMenuButton(
                title: 'events'.tr,
                iconData: Icons.event,
                onPressed: this._onTapEventSearchIcon),
          ],
        ),
      ),
      SpaceDivider.small(),
      Section(
        title: 'highlighted'.tr,
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.more_horiz),
            onSelected: (String selectedValue) => AppPages.openPVPlayListPage(
                controller.highlighted(),
                title: 'highlighted'.tr),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                  value: 'playall', child: Text('playAll'.tr)),
            ],
          )
        ],
        child: Obx(() => SongListView(
            displayPlaceholder: controller.highlighted.isEmpty,
            scrollDirection: Axis.horizontal,
            onSelect: (song) => this._onTapSong(song),
            songs: controller.highlighted.toList())),
      ),
      Section(
        title: 'recentAlbums'.tr,
        child: Obx(() => AlbumListView(
              displayPlaceholder: controller.recentAlbums.isEmpty,
              scrollDirection: Axis.horizontal,
              onSelect: (a) => this._onTapAlbum(a),
              albums: controller.recentAlbums.toList(),
            )),
      ),
      Section(
        title: 'randomPopularAlbums'.tr,
        child: Obx(() => AlbumListView(
            displayPlaceholder: controller.randomAlbums.isEmpty,
            scrollDirection: Axis.horizontal,
            onSelect: (a) => this._onTapAlbum(a),
            albums: controller.randomAlbums.toList())),
      ),
      Section(
        title: 'upcomingEvent'.tr,
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
