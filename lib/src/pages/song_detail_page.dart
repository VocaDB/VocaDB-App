import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vocadb_app/arguments.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/routes.dart';
import 'package:vocadb_app/services.dart';
import 'package:vocadb_app/utils.dart';
import 'package:vocadb_app/widgets.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SongDetailPage extends StatelessWidget {
  initController() {
    final httpService = Get.find<HttpService>();
    return SongDetailController(
        songRepository: SongRepository(httpService: httpService));
  }

  @override
  Widget build(BuildContext context) {
    final SongDetailController controller = initController();
    final SongDetailArgs args = Get.arguments;
    final String id = Get.parameters['id'];

    return PageBuilder<SongDetailController>(
      tag: "s_$id",
      controller: controller,
      builder: (c) => SongDetailPageView(controller: c, args: args),
    );
  }
}

class SongDetailPageView extends StatelessWidget {
  final SongDetailController controller;

  final SongDetailArgs args;

  const SongDetailPageView({this.controller, this.args});

  void _onSelectTag(TagModel tag) => AppPages.toTagDetailPage(tag);

  void _onTapLikeButton() {}

  void _onTapLyricButton() => controller.showLyric(true);

  void _onTapShareButton() => Share.share(controller.song().originUrl);

  void _onTapInfoButton() => launch(controller.song().originUrl);

  void _onSelectSong(SongModel song) => AppPages.toSongDetailPage(song);

  void _onTapArtist(ArtistRoleModel a) =>
      AppPages.toArtistDetailPage(ArtistModel(
          id: a.id,
          name: a.name,
          mainPicture: MainPictureModel(urlThumb: a.imageUrl)));

  void _onTapAlbum(AlbumModel album) => AppPages.toAlbumDetailPage(album);

  void _onTapCloseLyricContent() => controller.showLyric(false);

  Widget _buildVideoContent() {
    if (controller.youtubeController == null) {
      return Container();
    }

    return YoutubePlayer(
      controller: controller.youtubeController,
      onReady: () {
        controller.youtubeController.addListener(() => {});
      },
    );
  }

  Widget _buildSongImage() {
    if (controller.youtubeController != null) {
      return Container();
    }

    return Container(
        width: double.infinity,
        height: 160,
        color: Colors.black,
        child: Stack(
          children: [
            Opacity(
              opacity: 0.5,
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: CustomNetworkImage(
                  controller.song().imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: CustomNetworkImage(
                controller.song().imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(controller.song().name ?? 'Song Detail'),
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
              _buildVideoContent(),
              Obx(() => (controller.showLyric())
                  ? _buildLyricContent()
                  : _buildSongDetailContent()),
            ],
          ),
        ));
  }

  Widget _buildLyricContent() {
    return Expanded(
      child: LyricContent(
        lyrics: controller.song().lyrics,
        onTapClose: this._onTapCloseLyricContent,
      ),
    );
  }

  Widget _buildSongDetailContent() {
    return Expanded(
      child: ListView(
        children: [
          _buildSongImage(),
          _SongDetailButtonBar(
            onTapLikeButton: this._onTapLikeButton,
            onTapLyricButton: (controller.song().lyrics == null ||
                    controller.song().lyrics.isEmpty)
                ? null
                : this._onTapLyricButton,
            onTapShareButton: this._onTapShareButton,
            onTapInfoButton: this._onTapInfoButton,
          ),
          _SongDetailInfo(
            name: controller.song().name,
            additionalNames: controller.song().additionalNames,
            songType: controller.song().songType,
            publishedDate: controller.song().publishDateAsDateTime,
          ),
          SpaceDivider.small(),
          TagGroupView(
            onPressed: this._onSelectTag,
            tags: controller.song().tags,
          ),
          Divider(),
          ArtistGroupByRoleList.fromArtistSongModel(
            onTap: (a) => this._onTapArtist(a),
            artistSongs: controller.song().artists,
          ),
          Divider(),
          Visibility(
              visible: controller.song().pvs.isNotEmpty,
              child: Column(
                children: [
                  PVGroupList(pvs: controller.song().pvs),
                  Divider(),
                ],
              )),
          Visibility(
            visible: controller.song().albums.isNotEmpty,
            child: Column(
              children: [
                Section(
                  title: 'Albums',
                  child: AlbumListView(
                    scrollDirection: Axis.horizontal,
                    albums: controller.song().albums,
                    onSelect: (a) => this._onTapAlbum(a),
                  ),
                ),
                Divider()
              ],
            ),
          ),
          Obx(() => Visibility(
                visible: controller.altSongs.isNotEmpty,
                child: Column(
                  children: [
                    Section(
                      title: 'Alternate version',
                      child: SongListView(
                        scrollDirection: Axis.horizontal,
                        onSelect: (s) => this._onSelectSong(s),
                        songs: controller.altSongs.toList(),
                      ),
                    ),
                    Divider()
                  ],
                ),
              )),
          Obx(() => Visibility(
                visible: controller.relatedSongs.isNotEmpty,
                child: Column(
                  children: [
                    Section(
                      title: 'User who liked this also liked',
                      child: SongListView(
                        scrollDirection: Axis.horizontal,
                        onSelect: (s) => this._onSelectSong(s),
                        songs: controller.relatedSongs.toList(),
                      ),
                    ),
                    Divider()
                  ],
                ),
              )),
          Obx(() => Visibility(
                visible: controller.song().webLinks.isNotEmpty,
                child: WebLinkGroupList(webLinks: controller.song().webLinks),
              ))
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
          Visibility(
            visible: this.onTapLyricButton != null,
            child: Expanded(
              child: FlatButton(
                onPressed: this.onTapLyricButton,
                child: Column(
                  children: [Icon(Icons.subtitles), Text('Lyric')],
                ),
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
