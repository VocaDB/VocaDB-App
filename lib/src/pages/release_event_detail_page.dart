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

  void _onTapLikeButton() {}

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

  void _onTapMapButton() {}

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
            _ReleaseEventDetailButtonBar(
              onTapInfoButton: this._onTapInfoButton,
              onTapMapButton: this._onTapMapButton,
              onTapShareButton: this._onTapShareButton,
            ),
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
                  title: 'Name',
                  text: controller.event().name,
                  divider: SpaceDivider.small(),
                ),
                TextInfoSection(
                  title: 'Category',
                  text: controller.event().displayCategory,
                  divider: SpaceDivider.small(),
                ),
                TextInfoSection(
                  title: 'Date',
                  text: controller.event().dateFormatted,
                  divider: SpaceDivider.small(),
                ),
                TextInfoSection(
                  title: 'Venue',
                  text: controller.event().venueName,
                  divider: SpaceDivider.small(),
                ),
                if (controller.event().description != null)
                  InfoSection(
                    title: 'Description',
                    visible: !controller.event().description.isNullOrBlank,
                    child: MarkdownBody(
                      data: controller.event().description,
                      selectable: true,
                    ),
                  ),
                Divider(),
                Section(
                  title: 'Participating artists',
                  visible: controller.event().artists.isNotEmpty,
                  child: ArtistGroupByRoleList.fromArtistEventModel(
                    artistEvents: controller.event().artists,
                    onTap: this._onTapArtist,
                    displayRole: false,
                  ),
                  divider: Divider(),
                ),
                Section(
                  title: 'Songs',
                  visible: controller.songs().length > 0,
                  child: SongListView(
                    scrollDirection: Axis.horizontal,
                    onSelect: (s) => {},
                    songs: controller.songs(),
                  ),
                  divider: Divider(),
                ),
                Section(
                  title: 'Albums',
                  visible: controller.albums().length > 0,
                  child: AlbumListView(
                    scrollDirection: Axis.horizontal,
                    albums: controller.albums(),
                  ),
                  divider: Divider(),
                ),
                Section(
                  title: 'Series',
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

class _ReleaseEventDetailButtonBar extends StatelessWidget {
  final VoidCallback onTapShareButton;

  final VoidCallback onTapMapButton;

  final VoidCallback onTapInfoButton;

  const _ReleaseEventDetailButtonBar(
      {this.onTapShareButton, this.onTapMapButton, this.onTapInfoButton});

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
              onPressed: this.onTapMapButton,
              child: Column(
                children: [Icon(Icons.place), Text('Map')],
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
