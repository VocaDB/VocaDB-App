import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
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

class ReleaseEventDetailPage extends StatelessWidget {
  initController() {
    final httpService = Get.find<HttpService>();
    return ReleaseEventDetailController(
        eventRepository: ReleaseEventRepository(httpService: httpService));
  }

  @override
  Widget build(BuildContext context) {
    final ReleaseEventDetailController controller = initController();
    final ReleaseEventDetailArgs args = Get.arguments;
    final String id = Get.parameters['id'];

    return PageBuilder<ReleaseEventDetailController>(
      tag: "event_$id",
      controller: controller,
      builder: (c) => ReleaseEventDetailPageView(controller: c, args: args),
    );
  }
}

class ReleaseEventDetailPageView extends StatelessWidget {
  final ReleaseEventDetailController controller;

  final ReleaseEventDetailArgs args;

  const ReleaseEventDetailPageView({this.controller, this.args});

  void _onSelectTag(TagModel tag) => AppPages.toTagDetailPage(tag);

  void _onTapShareButton() => Share.share(controller.event().originUrl);

  void _onTapInfoButton() => launch(controller.event().originUrl);

  void _onTapSong(SongModel song) => AppPages.toSongDetailPage(song);

  void _onTapArtist(ArtistRoleModel a) =>
      AppPages.toArtistDetailPage(ArtistModel(
          id: a.id,
          name: a.name,
          mainPicture: MainPictureModel(urlThumb: a.imageUrl)));

  void _onTapAlbum(AlbumModel album) => AppPages.toAlbumDetailPage(album);

  void _onTapHome() => Get.offAll(MainPage());

  void _onTapEntrySearch() => Get.to(EntrySearchPage());

  void _onTapMapButton() {
    String q = controller.event().venueName;
    String uri = Uri.encodeFull('geo:0,0?q=$q');
    canLaunch(uri).then((can) => (can)
        ? launch(uri)
        : launch(Uri.encodeFull('https://maps.apple.com/?q=$q')));
  }

  Widget _buttonBarBuilder() {
    List<Widget> buttons = [];

    buttons.add(FlatButton(
      onPressed: this._onTapShareButton,
      child: Column(
        children: [Icon(Icons.share), Text('share'.tr)],
      ),
    ));

    if (controller.event().venueName != null) {
      buttons.add(FlatButton(
        onPressed: this._onTapMapButton,
        child: Column(
          children: [Icon(Icons.place), Text('map'.tr)],
        ),
      ));
    }

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
              title: Text(
                controller.event().name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              background: SafeArea(
                child: Opacity(
                  opacity: 0.7,
                  child: Visibility(
                    visible: controller.event().imageUrl != null,
                    child: CustomNetworkImage(
                      controller.event().imageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            )),
        Obx(
          () => SliverList(
              delegate: SliverChildListDelegate([
            _buttonBarBuilder(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpaceDivider.small(),
                TagGroupView(
                  onPressed: this._onSelectTag,
                  tags: controller
                          .event()
                          ?.tagGroups
                          ?.map((t) => t.tag)
                          ?.toList() ??
                      [],
                ),
                SpaceDivider.small(),
                TextInfoSection(
                  title: 'name'.tr,
                  text: controller.event().name,
                  divider: SpaceDivider.small(),
                ),
                TextInfoSection(
                  title: 'category'.tr,
                  text:
                      'eventCategory.${controller.event().displayCategory}'.tr,
                  divider: SpaceDivider.small(),
                ),
                TextInfoSection(
                  title: 'date'.tr,
                  text: controller.event().dateFormatted,
                  divider: SpaceDivider.small(),
                ),
                TextInfoSection(
                  title: 'venue'.tr,
                  text: controller.event().venueName,
                  divider: SpaceDivider.small(),
                ),
                if (controller.event().description != null)
                  InfoSection(
                    title: 'description'.tr,
                    visible: !controller.event().description.isNullOrBlank,
                    child: MarkdownBody(
                      data: controller.event().description,
                      selectable: true,
                    ),
                  ),
                Divider(),
                Section(
                  title: 'participatingArtists'.tr,
                  visible: controller.event().artists?.isNotEmpty,
                  child: ArtistGroupByRoleList.fromArtistEventModel(
                    artistEvents: controller.event().artists ?? [],
                    onTap: this._onTapArtist,
                    displayRole: false,
                  ),
                  divider: Divider(),
                ),
                Section(
                  title: 'songs'.tr,
                  visible: controller.songs().length > 0,
                  child: SongListView(
                    scrollDirection: Axis.horizontal,
                    onSelect: this._onTapSong,
                    songs: controller.songs(),
                  ),
                  divider: Divider(),
                ),
                Section(
                  title: 'albums'.tr,
                  visible: controller.albums().length > 0,
                  child: AlbumListView(
                    scrollDirection: Axis.horizontal,
                    albums: controller.albums(),
                    onSelect: this._onTapAlbum,
                  ),
                  divider: Divider(),
                ),
                Section(
                  title: 'series'.tr,
                  visible: controller.event().series != null,
                  child: ReleaseEventSeriesTile(
                    name: controller.event()?.series?.name,
                  ),
                  divider: Divider(),
                ),
                WebLinkGroupList(webLinks: controller.event().webLinks)
              ],
            )
          ])),
        )
      ],
    ));
  }
}
