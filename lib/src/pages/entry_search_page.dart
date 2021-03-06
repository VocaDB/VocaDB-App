import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/routes.dart';
import 'package:vocadb_app/src/pages/entry_search_filter_page.dart';
import 'package:vocadb_app/widgets.dart';

class EntrySearchPage extends GetView<EntrySearchController> {
  void _onSelect(EntryModel entryModel) {
    switch (entryModel.entryType) {
      case EntryType.Song:
        AppPages.toSongDetailPage(SongModel.fromEntry(entryModel));
        break;

      case EntryType.Artist:
        AppPages.toArtistDetailPage(ArtistModel.fromEntry(entryModel));
        break;

      case EntryType.Album:
        AppPages.toAlbumDetailPage(AlbumModel.fromEntry(entryModel));
        break;

      case EntryType.Tag:
        AppPages.toTagDetailPage(TagModel.fromEntry(entryModel));
        break;

      case EntryType.ReleaseEvent:
        AppPages.toReleaseEventDetailPage(
            ReleaseEventModel.fromEntry(entryModel));
        break;

      default:
        print('Unsupported entry $entryModel');
    }
  }

  Widget _buildTextInput(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: controller.textSearchController,
            onChanged: controller.query,
            style: Theme.of(context).primaryTextTheme.headline6,
            autofocus: true,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'search'.tr),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 100),
      child: Obx(() => (controller.openQuery.value)
          ? _buildTextInput(context)
          : Text('search'.tr)),
    );
  }

  Widget _buildSearchAction(BuildContext context) {
    return Obx(
      () => (controller.openQuery.value)
          ? IconButton(
              icon: Icon(Icons.clear), onPressed: () => controller.clearQuery())
          : IconButton(
              icon: Icon(Icons.search),
              onPressed: () => controller.openQuery(true)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: _buildTitle(context), actions: <Widget>[
          _buildSearchAction(context),
          IconButton(
              icon: Icon(Icons.tune),
              onPressed: () => Get.to(EntrySearchFilterPage())),
        ]),
        body: Obx(
          () => (controller.query.string.isEmpty)
              ? CenterText('findAnything'.tr)
              : (controller.errorMessage.string.isNotEmpty)
                  ? CenterText(controller.errorMessage.string)
                  : EntryListView(
                      entries: controller.results.toList(),
                      onSelect: this._onSelect,
                      emptyWidget: CenterText('searchResultNotMatched'.tr)),
        ));
  }
}
