import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/arguments.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/routes.dart';
import 'package:vocadb_app/src/controllers/pv_playlist_controller.dart';
import 'package:vocadb_app/src/widgets/custom_network_image.dart';
import 'package:vocadb_app/widgets.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PVPlaylistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PVPlayListController controller = PVPlayListController();
    final PVPlayListArgs args = Get.arguments;

    return PageBuilder<PVPlayListController>(
      controller: controller,
      builder: (c) => PVPlaylistPageView(controller: c, args: args),
    );
  }
}

class PVPlaylistPageView extends StatelessWidget {
  final PVPlayListController controller;

  final PVPlayListArgs args;

  const PVPlaylistPageView({this.controller, this.args});

  void _onTapToSongDetail(SongModel song) => AppPages.toSongDetailPage(song);

  void _onTapSongItem(int index) => controller.onSelect(index);

  void _onTapHome() => Get.offAll(MainPage());

  void _onTapEntrySearch() => Get.to(EntrySearchPage());

  Widget _buildVideoContent() {
    if (controller.youtubeController == null) {
      return Container();
    }

    return YoutubePlayer(
      controller: controller.youtubeController,
      showVideoProgressIndicator: true,
      onEnded: (_) => controller.onEnded(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(args.title),
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
        body: Column(
          children: [
            _buildVideoContent(),
            Expanded(
                child: ListView.builder(
              itemCount: controller.songs().length,
              itemBuilder: (context, index) => Obx(
                () => _PVPlayerItem.fromSong(
                  controller.songs()[index],
                  onTap: () => this._onTapSongItem(index),
                  onPressViewDetail: () =>
                      this._onTapToSongDetail(controller.songs()[index]),
                  enabled: controller.songs()[index].youtubePV != null,
                  isActive: controller.currentIndex.toInt() == index,
                ),
              ),
            ))
          ],
        ));
  }
}

class _PVPlayerItem extends StatelessWidget {
  final String imageUrl;

  final String name;

  final String artistName;

  final bool isActive;

  final bool enabled;

  /// Callback when tap popup menu item for view song/pv detail
  final VoidCallback onPressViewDetail;

  /// Callback when tap an list item
  final VoidCallback onTap;

  const _PVPlayerItem(
      {Key key,
      this.imageUrl,
      this.name,
      this.artistName,
      this.isActive = false,
      this.enabled = true,
      this.onPressViewDetail,
      this.onTap})
      : super(key: key);

  _PVPlayerItem.fromSong(SongModel song,
      {this.isActive = false,
      this.enabled = true,
      this.onTap,
      this.onPressViewDetail})
      : this.imageUrl = song.imageUrl,
        this.name = song.name,
        this.artistName = song.artistString;

  Widget _buildImageLeading() {
    return SizedBox(
      width: 72,
      child: CustomNetworkImage(this.imageUrl),
    );
  }

  Widget _buildLeading() {
    return (enabled)
        ? _buildImageLeading()
        : Opacity(
            opacity: 0.5,
            child: _buildImageLeading(),
          );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      leading: this._buildLeading(),
      title: Text(
        this.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(this.artistName),
      enabled: this.enabled,
      trailing: PopupMenuButton<String>(
        onSelected: (String selectedValue) => this.onPressViewDetail(),
        itemBuilder: (BuildContext context) => [
          PopupMenuItem<String>(value: 'detail', child: Text('View detail')),
        ],
      ),
      onTap: this.onTap,
      tileColor: (this.isActive) ? Theme.of(context).highlightColor : null,
    );
  }
}
