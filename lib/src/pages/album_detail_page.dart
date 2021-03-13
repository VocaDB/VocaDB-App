import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vocadb_app/arguments.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/loggers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/routes.dart';
import 'package:vocadb_app/services.dart';
import 'package:vocadb_app/widgets.dart';

class AlbumDetailPage extends StatelessWidget {
  initController() {
    final httpService = Get.find<HttpService>();
    final authService = Get.find<AuthService>();
    return AlbumDetailController(
        albumRepository: AlbumRepository(httpService: httpService),
        userRepository: UserRepository(httpService: httpService),
        authService: authService);
  }

  @override
  Widget build(BuildContext context) {
    final AlbumDetailController controller = initController();
    final AlbumDetailArgs args = Get.arguments;
    final String id = Get.parameters['id'];
    Get.find<AnalyticLog>().logViewAlbumDetail(args.id);

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

  void _onTapEntrySearch() => Get.toNamed(Routes.ENTRIES);

  void _onTapArtist(ArtistRoleModel artistRoleModel) =>
      Get.to(ArtistDetailPage());

  void _onSelectTag(TagModel tag) => AppPages.toTagDetailPage(tag);

  void _onTapCollectButton() {
    Get.dialog(Obx(
      () => AlbumCollectionStatusDialog(
        purchaseStatus: controller.purchaseStatus.value,
        mediaType: controller.mediaType.value,
        rating: controller.rating.value,
        onPurchaseStatusChanged: controller.purchaseStatus,
        onMediaTypeChanged: controller.mediaType,
        onRatingChanged: (String rating) =>
            controller.rating(int.parse(rating)),
      ),
    ));
  }

  Widget _buttonBarBuilder() {
    final authService = Get.find<AuthService>();

    List<Widget> buttons = [];

    buttons.add(Obx(
      () => ActiveFlatButton(
        icon: Icon(Icons.favorite),
        label: (controller.collectionStatus.value.isCollected)
            ? controller.collectionStatus.value.purchaseStatus
            : 'collect'.tr,
        active: controller.collectionStatus.value.isCollected,
        onPressed: (authService.currentUser().id == null ||
                controller.statusLoading.value)
            ? null
            : this._onTapCollectButton,
      ),
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
                  visible: controller.album().ratingCount != null &&
                      controller.album().ratingCount > 0,
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
            _buttonBarBuilder(),
            TagGroupView(
              onPressed: this._onSelectTag,
              tags: controller.album().tags ?? [],
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
                    artistAlbums: controller.album().artists ?? [],
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
            WebLinkGroupList(webLinks: controller.album().webLinks ?? []),
            SpaceDivider.medium()
          ])),
        )
      ],
    ));
  }
}

class AlbumCollectionStatusDialog extends StatelessWidget {
  final String purchaseStatus;

  final String mediaType;

  final int rating;

  final Function(String) onPurchaseStatusChanged;

  final Function(String) onMediaTypeChanged;

  final Function(String) onRatingChanged;

  final Function(String, String, String) onSaved;

  const AlbumCollectionStatusDialog(
      {this.purchaseStatus,
      this.mediaType,
      this.rating,
      this.onPurchaseStatusChanged,
      this.onMediaTypeChanged,
      this.onRatingChanged,
      this.onSaved});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit album in collection"),
        actions: [
          IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                this.onSaved(this.purchaseStatus, this.mediaType,
                    this.rating.toString());
                Get.close(0);
              })
        ],
      ),
      body: Container(
        child: Column(
          children: [
            SimpleDropdownInput.fromJsonArray(
              label: 'Status',
              value: purchaseStatus,
              onChanged: this.onPurchaseStatusChanged,
              json: [
                {'name': 'Nothing'.tr, 'value': ''},
                {'name': 'Wishlisted'.tr, 'value': 'Wishlisted'},
                {'name': 'Ordered'.tr, 'value': 'Ordered'},
                {'name': 'Owned'.tr, 'value': 'Owned'},
              ],
            ),
            SimpleDropdownInput.fromJsonArray(
              label: 'Media type',
              value: mediaType,
              onChanged: this.onMediaTypeChanged,
              json: [
                {'name': 'Unspecified'.tr, 'value': ''},
                {'name': 'Physical disc'.tr, 'value': 'PhysicalDisc'},
                {'name': 'Digital download'.tr, 'value': 'DigitalDownload'},
              ],
            ),
            SimpleDropdownInput.fromJsonArray(
              label: 'Rating',
              value: rating.toString(),
              onChanged: this.onRatingChanged,
              json: [
                {'name': 'Nothing'.tr, 'value': '0'},
                {'name': '1', 'value': '1'},
                {'name': '2', 'value': '2'},
                {'name': '3', 'value': '3'},
                {'name': '4', 'value': '4'},
                {'name': '5', 'value': '5'}
              ],
            ),
          ],
        ),
      ),
    );
  }
}
