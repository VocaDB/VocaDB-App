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
    final ArtistDetailArgs args = Get.arguments;
    final String id = Get.parameters['id'];

    return PageBuilder<ArtistDetailController>(
      tag: "a_$id",
      controller: controller,
      builder: (c) => ArtistDetailPageView(controller: c, args: args),
    );
  }
}

class ArtistDetailPageView extends StatelessWidget {
  final ArtistDetailController controller;

  final ArtistDetailArgs args;

  const ArtistDetailPageView({this.controller, this.args});

  void _onSelectTag(TagModel tag) => AppPages.toTagDetailPage(tag);

  void _onTapLikeButton() {}

  void _onTapShareButton() => Share.share(controller.artist().originUrl);

  void _onTapInfoButton() => launch(controller.artist().originUrl);

  void _onTapSong(SongModel song) => AppPages.toSongDetailPage(song);

  void _onTapArtist(ArtistModel artist) => AppPages.toArtistDetailPage(artist);

  void _onTapAlbum(AlbumModel album) => AppPages.toAlbumDetailPage(album);

  void _onTapHome() => Get.offAll(MainPage());

  void _onTapEntrySearch() => Get.to(EntrySearchPage());

  Widget _buttonBarBuilder() {
    final authService = Get.find<AuthService>();

    List<Widget> buttons = [];

    buttons.add(ActiveFlatButton(
      icon: Icon(Icons.favorite),
      label: 'like'.tr,
      active: controller.liked.value,
      onPressed:
          (authService.currentUser().id == null) ? null : this._onTapLikeButton,
    ));

    buttons.add(FlatButton(
      onPressed: this._onTapShareButton,
      child: Column(
        children: [Icon(Icons.share), Text('share'.tr)],
      ),
    ));

    buttons.add(FlatButton(
      onPressed: this._onTapInfoButton,
      child: Column(
        children: [Icon(Icons.info), Text('info'.tr)],
      ),
    ));

    return ButtonBar(
      alignment: MainAxisAlignment.spaceEvenly,
      children: buttons,
    );
  }

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
                  child: CustomNetworkImage(
                    controller.artist().imageUrl,
                  ),
                ),
              ),
            )),
        SliverList(
            delegate: SliverChildListDelegate([
          _buttonBarBuilder(),
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
                      Text('artistType.${controller.artist().artistType}'.tr ??
                          ''),
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
                      Visibility(
                        visible: controller.artist().releaseDate != null,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextInfoSection(
                            title: 'releasedDate'.tr,
                            text: controller.artist().releaseDateFormatted,
                          ),
                        ),
                      ),
                      SpaceDivider.small(),
                      Visibility(
                        visible: controller.artist().description != null,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextInfoSection(
                            title: 'description'.tr,
                            text: controller.artist().description,
                          ),
                        ),
                      ),
                      SpaceDivider.small(),
                      Visibility(
                        visible: controller.artist().artistLinks != null &&
                            controller.artist().artistLinks.isNotEmpty,
                        child: ArtistLinkListView(
                            artistLinks: controller.artist().artistLinks,
                            onSelect: (artistLinkModel) =>
                                this._onTapArtist(artistLinkModel.artist)),
                      ),
                      Visibility(
                        visible: controller.artist().artistLinksReverse !=
                                null &&
                            controller.artist().artistLinksReverse.isNotEmpty,
                        child: ArtistLinkListView(
                            reverse: true,
                            artistLinks: controller.artist().artistLinksReverse,
                            onSelect: (artistLinkModel) =>
                                this._onTapArtist(artistLinkModel.artist)),
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
                        title: 'recentSongsPVs'.tr,
                        child: SongListView(
                          scrollDirection: Axis.horizontal,
                          songs: controller.artist().relations?.latestSongs,
                          onSelect: (s) => this._onTapSong(s),
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
                        title: 'popularSongs'.tr,
                        child: SongListView(
                          scrollDirection: Axis.horizontal,
                          onSelect: (s) => this._onTapSong(s),
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
                        title: 'recentAlbums'.tr,
                        child: AlbumListView(
                          scrollDirection: Axis.horizontal,
                          albums: controller.artist().relations?.latestAlbums,
                          onSelect: (al) => this._onTapAlbum(al),
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
                        title: 'popularAlbums'.tr,
                        child: AlbumListView(
                          scrollDirection: Axis.horizontal,
                          albums: controller.artist().relations?.popularAlbums,
                          onSelect: (al) => this._onTapAlbum(al),
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
