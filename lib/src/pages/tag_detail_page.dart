import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vocadb_app/arguments.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/routes.dart';
import 'package:vocadb_app/services.dart';
import 'package:vocadb_app/src/controllers/tag_detail_controller.dart';
import 'package:vocadb_app/widgets.dart';

class TagDetailPage extends StatelessWidget {
  initController() {
    final httpService = Get.find<HttpService>();
    return TagDetailController(
        tagRepository: TagRepository(httpService: httpService),
        songRepository: SongRepository(httpService: httpService),
        artistRepository: ArtistRepository(httpService: httpService),
        albumRepository: AlbumRepository(httpService: httpService));
  }

  @override
  Widget build(BuildContext context) {
    final TagDetailController controller = initController();
    final TagDetailArgs args = Get.arguments;
    final String id = Get.parameters['id'];

    return PageBuilder<TagDetailController>(
      tag: "t_$id",
      controller: controller,
      builder: (c) => TagDetailPageView(controller: c, args: args),
    );
  }
}

class TagDetailPageView extends StatelessWidget {
  final TagDetailController controller;

  final TagDetailArgs args;

  const TagDetailPageView({this.controller, this.args});

  void _onSelectTag(TagModel tag) => AppPages.toTagDetailPage(tag);

  void _onTapShareButton() => Share.share(controller.tag().originUrl);

  void _onTapInfoButton() => launch(controller.tag().originUrl);

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
                '#${controller.tag().name}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              background: SafeArea(
                child: Opacity(
                  opacity: 0.7,
                  child: Visibility(
                    visible: controller.tag().imageUrl != null,
                    child: CustomNetworkImage(
                      controller.tag().imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            )),
        Obx(
          () => SliverList(
              delegate: SliverChildListDelegate([
            _TagDetailButtonBar(
              onTapInfoButton: this._onTapInfoButton,
              onTapShareButton: this._onTapShareButton,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextInfoSection(
                  title: 'Name',
                  text: controller.tag().name,
                ),
                SpaceDivider.small(),
                TextInfoSection(
                  title: 'Category',
                  text: controller.tag().categoryName,
                ),
                SpaceDivider.small(),
                InfoSection(
                    title: 'Parent',
                    child: Tag(
                      label: controller.tag().parent?.name,
                      onPressed: () => this._onSelectTag(controller.tag()),
                    )),
                SpaceDivider.small(),
                TextInfoSection(
                  title: 'Description',
                  text: controller.tag().description,
                ),
                Divider(),
                Section(
                  title: 'Latest songs',
                  visible: controller.latestSongs().length > 0,
                  child: SongListView(
                    displayPlaceholder: controller.latestSongs.isEmpty,
                    scrollDirection: Axis.horizontal,
                    onSelect: this._onTapSong,
                    songs: controller.latestSongs(),
                  ),
                  divider: Divider(),
                ),
                Section(
                  title: 'Top artists',
                  visible: controller.topArtists().length > 0,
                  child: ArtistColumnView(
                    onSelect: this._onTapArtist,
                    artists: controller.topArtists(),
                  ),
                  divider: Divider(),
                ),
                Section(
                  title: 'Top songs',
                  visible: controller.topSongs().length > 0,
                  child: SongListView(
                    scrollDirection: Axis.horizontal,
                    onSelect: this._onTapSong,
                    songs: controller.topSongs(),
                  ),
                  divider: Divider(),
                ),
                Section(
                  title: 'Top albums',
                  visible: controller.topAlbums().length > 0,
                  child: AlbumListView(
                    onSelect: this._onTapAlbum,
                    scrollDirection: Axis.horizontal,
                    albums: controller.topAlbums(),
                  ),
                  divider: Divider(),
                ),
                WebLinkGroupList(webLinks: controller.tag().webLinks)
              ],
            )
          ])),
        )
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
