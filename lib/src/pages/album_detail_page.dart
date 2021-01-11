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

class AlbumDetailPage extends StatelessWidget {
  initController() {
    final httpService = Get.find<HttpService>();
    return AlbumDetailController(
        albumRepository: AlbumRepository(httpService: httpService));
  }

  @override
  Widget build(BuildContext context) {
    final AlbumDetailController controller = initController();
    final AlbumDetailArgs args = Get.arguments;
    final String id = Get.parameters['id'];

    return PageBuilder<AlbumDetailController>(
      tag: "al_$id",
      controller: controller,
      builder: (c) => AlbumDetailPageView(controller: c, args: args),
    );
  }
}

class AlbumDetailPageView extends StatelessWidget {
  final AlbumDetailController controller;

  final AlbumDetailArgs args;

  const AlbumDetailPageView({this.controller, this.args});

  void _onTapTrack(TrackModel track) => AppPages.toSongDetailPage(track.song);

  void _onTapShareButton() => Share.share(controller.album().originUrl);

  void _onTapInfoButton() => launch(controller.album().originUrl);

  void _onTapHome() => Get.offAll(MainPage());

  void _onTapEntrySearch() => Get.to(EntrySearchPage());

  void _onTapArtist(ArtistRoleModel artistRoleModel) =>
      Get.to(ArtistDetailPage());

  void _onSelectTag(TagModel tag) => AppPages.toTagDetailPage(tag);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          title: Text(controller.album().name),
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
        Obx(
          () => SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(
              width: 160,
              height: 160,
              child: CustomNetworkImage(
                controller.album().imageUrl,
              ),
            ),
            SpaceDivider.small(),
            Column(
              children: [
                Visibility(
                  visible: controller.album().ratingCount > 0,
                  child: Text(
                      '${controller.album().ratingAverage} ★ (${controller.album().ratingCount})'),
                ),
                SpaceDivider.small(),
                Text(
                  controller.album().name,
                  style: Theme.of(context).textTheme.headline6,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                SpaceDivider.small(),
                Text(controller.album().artistString),
                SpaceDivider.micro(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${('discType.' + controller.album().discType).tr} • ${'discOnSaleDate'.trArgs([
                        controller.album().releaseDateFormatted
                      ])}',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                )
              ],
            ),
            SpaceDivider.micro(),
            _AlbumDetailButtonBar(
              onTapInfoButton: this._onTapInfoButton,
              onTapShareButton: this._onTapShareButton,
            ),
            TagGroupView(
              onPressed: this._onSelectTag,
              tags: controller.album().tags,
            ),
            ExpandableContent(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextInfoSection(
                      title: 'name'.tr,
                      text: controller.album().name,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextInfoSection(
                      title: 'description'.tr,
                      text: controller.album().description,
                    ),
                  ),
                  Divider(),
                  ArtistGroupByRoleList.fromArtistAlbumModel(
                    onTap: this._onTapArtist,
                    artistAlbums: controller.album().artists,
                    // prefixHeroTag: 'album_detail_${args.id}',
                  ),
                ],
              ),
            ),
            Divider(),
            TrackListView(
              tracks: controller.album().tracks,
              onSelect: this._onTapTrack,
            ),
            Divider(),
            WebLinkGroupList(webLinks: controller.album().webLinks),
            SpaceDivider.medium()
          ])),
        )
      ],
    ));
  }
}

class _AlbumDetailButtonBar extends StatelessWidget {
  final VoidCallback onTapLikeButton;

  final VoidCallback onTapShareButton;

  final VoidCallback onTapInfoButton;

  const _AlbumDetailButtonBar(
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
                children: [Icon(Icons.favorite), Text('like'.tr)],
              ),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: this.onTapShareButton,
              child: Column(
                children: [Icon(Icons.share), Text('share'.tr)],
              ),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: this.onTapInfoButton,
              child: Column(
                children: [Icon(Icons.info), Text('info'.tr)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
