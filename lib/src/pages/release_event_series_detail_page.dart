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

class ReleaseEventSeriesDetailPage extends StatelessWidget {
  initController() {
    final httpService = Get.find<HttpService>();
    return ReleaseEventSeriesDetailController(
        eventSeriesRepository:
            ReleaseEventSeriesRepository(httpService: httpService));
  }

  @override
  Widget build(BuildContext context) {
    final ReleaseEventSeriesDetailController controller = initController();
    final ReleaseEventSeriesDetailArgs args = Get.arguments;
    final String id = Get.parameters['id'];
    Get.find<AnalyticLog>().logViewReleaseEventDetail(args.id);

    return PageBuilder<ReleaseEventSeriesDetailController>(
      tag: "event_series_$id",
      controller: controller,
      builder: (c) =>
          ReleaseEventSeriesDetailPageView(controller: c, args: args),
    );
  }
}

class ReleaseEventSeriesDetailPageView extends StatelessWidget {
  final ReleaseEventSeriesDetailController controller;

  final ReleaseEventSeriesDetailArgs args;

  const ReleaseEventSeriesDetailPageView({this.controller, this.args});

  void _onTapShareButton() => Share.share(controller.eventSeries().originUrl);

  void _onTapInfoButton() => launch(controller.eventSeries().originUrl);

  void _onTapHome() => Get.offAll(MainPage());

  void _onTapEntrySearch() => Get.toNamed(Routes.ENTRIES);

  void _onSelectTag(TagModel tag) => AppPages.toTagDetailPage(tag);

  Widget buildData() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
          pinned: true,
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
          flexibleSpace: FlexibleSpaceBar(
            title: Text(controller.eventSeries().name),
            background: (controller.eventSeries().imageUrl == null)
                ? Container()
                : CustomNetworkImage(controller.eventSeries().imageUrl),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            SpaceDivider.small(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  onPressed: this._onTapShareButton,
                  child: Column(
                    children: [Icon(Icons.share), Text('share'.tr)],
                  ),
                ),
                FlatButton(
                  onPressed: this._onTapInfoButton,
                  child: Column(
                    children: [Icon(Icons.info), Text('info'.tr)],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TagGroupView(
                    onPressed: this._onSelectTag,
                    tags: controller
                            .eventSeries()
                            ?.tagGroups
                            ?.map((t) => t.tag)
                            ?.toList() ??
                        [],
                  ),
                  TextInfoSection(
                    title: 'name'.tr,
                    text: controller.eventSeries().name,
                  ),
                  TextInfoSection(
                    title: 'category'.tr,
                    text:
                        'eventCategory.${controller.eventSeries().category}'.tr,
                  ),
                  TextInfoSection(
                    title: 'description'.tr,
                    text: controller.eventSeries().description,
                  ),
                ],
              ),
            ),
            Section(
              title: 'references'.tr,
              child: Column(
                children: controller
                    .eventSeries()
                    .webLinks
                    .map((e) => WebLinkTile(
                          title: e.description,
                          url: e.url,
                        ))
                    .toList(),
              ),
            ),
            Section(
              title: 'events'.tr,
              child: Column(
                children: controller
                    .eventSeries()
                    .events
                    .map((e) => ListTile(
                          leading: Icon(Icons.event),
                          title: Text(e.name ?? '<unknown>'),
                          subtitle: Text(e.dateFormatted ?? ''),
                        ))
                    .toList(),
              ),
            ),
          ]),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => (controller.initialLoading.value)
          ? CenterLoading()
          : (controller.errorMessage.string.isNotEmpty)
              ? CenterText(controller.errorMessage.string)
              : buildData(),
    ));
  }
}
