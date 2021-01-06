import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/routes.dart';
import 'package:vocadb_app/services.dart';
import 'package:vocadb_app/widgets.dart';

class ArtistDetailPage extends StatelessWidget {
  initController() {
    final httpService = Get.find<HttpService>();
    return ArtistDetailController(
        artistRepository: ArtistRepository(httpService: httpService));
  }

  @override
  Widget build(BuildContext context) {
    final ArtistDetailController controller = initController();
    final String id = Get.parameters['id'];

    return PageBuilder<ArtistDetailController>(
      tag: "a_$id",
      controller: controller,
      builder: (c) => ArtistDetailPageView(
        controller: c,
      ),
    );
  }
}

class ArtistDetailPageView extends StatelessWidget {
  final ArtistDetailController controller;

  const ArtistDetailPageView({this.controller});

  void _onSelectTag(TagModel tag) {}

  void _onTapLikeButton() {}

  void _onTapShareButton() => Share.share(controller.artist().originUrl);

  void _onTapInfoButton() => launch(controller.artist().originUrl);

  void _onTapSong(SongModel song) => AppPages.toSongDetailPage(song);

  void _onTapArtist(ArtistModel artist) => AppPages.toArtistDetailPage(artist);

  void _onTapAlbum(AlbumModel album) {}

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
              title: Text(controller.artist().name),
              background: SafeArea(
                child: Opacity(
                  opacity: 0.7,
                  child: CustomNetworkImage(controller.artist().imageUrl),
                ),
              ),
            )),
        SliverList(
            delegate: SliverChildListDelegate([
          _ArtistDetailButtonBar(
            onTapInfoButton: this._onTapInfoButton,
            onTapShareButton: this._onTapShareButton,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.artist().name,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Visibility(
                          visible: controller.artist().additionalNames != null,
                          child:
                              Text(controller.artist().additionalNames ?? '')),
                      Text(controller.artist().artistType ?? ''),
                    ],
                  ),
                ),
              ),
              SpaceDivider.small(),
              Obx(
                () => TagGroupView(
                  onPressed: this._onSelectTag,
                  tags: controller.artist().tags,
                ),
              ),
              SpaceDivider.small(),
              Obx(
                () => ExpandableContent(
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
                          text: controller.artist().description,
                        ),
                      ),
                      SpaceDivider.small(),
                      Visibility(
                        visible: controller.artist().artistLinks != null &&
                            controller.artist().artistLinks.isNotEmpty,
                        child: ArtistLinkListView(
                          artistLinks: controller.artist().artistLinks,
                          onSelect: (artistLinkModel) =>
                              this._onTapArtist(artistLinkModel.artist),
                        ),
                      ),
                      Visibility(
                        visible: controller.artist().artistLinksReverse !=
                                null &&
                            controller.artist().artistLinksReverse.isNotEmpty,
                        child: ArtistLinkListView(
                          artistLinks: controller.artist().artistLinksReverse,
                          onSelect: (artistLinkModel) =>
                              this._onTapArtist(artistLinkModel.artist),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(),
              Obx(
                () => Visibility(
                  visible: controller.artist().relations != null &&
                      controller.artist().relations.latestSongs.isNotEmpty,
                  child: Column(
                    children: [
                      Section(
                        title: 'Recent Songs / PVs',
                        child: SongListView(
                          scrollDirection: Axis.horizontal,
                          onSelect: this._onTapSong,
                          songs: controller.artist().relations?.latestSongs,
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: controller.artist().relations != null &&
                      controller.artist().relations.popularSongs.isNotEmpty,
                  child: Column(
                    children: [
                      Section(
                        title: 'Popular songs',
                        child: SongListView(
                          scrollDirection: Axis.horizontal,
                          onSelect: this._onTapSong,
                          songs: controller.artist().relations?.popularSongs,
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: controller.artist().relations != null &&
                      controller.artist().relations.latestAlbums.isNotEmpty,
                  child: Column(
                    children: [
                      Section(
                        title: 'Recent or upcoming albums',
                        child: AlbumListView(
                          scrollDirection: Axis.horizontal,
                          albums: controller.artist().relations?.latestAlbums,
                          onSelect: this._onTapAlbum,
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: controller.artist().relations != null &&
                      controller.artist().relations.popularAlbums.isNotEmpty,
                  child: Column(
                    children: [
                      Section(
                        title: 'Popular albums',
                        child: AlbumListView(
                          scrollDirection: Axis.horizontal,
                          albums: controller.artist().relations?.popularAlbums,
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
              Visibility(
                  visible: controller.artist().webLinks != null &&
                      controller.artist().webLinks.isNotEmpty,
                  child: WebLinkGroupList(
                      webLinks: controller.artist().webLinks ?? []))
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
