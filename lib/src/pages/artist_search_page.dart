import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/arguments.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/routes.dart';
import 'package:vocadb_app/widgets.dart';

class ArtistSearchPage extends GetView<ArtistSearchController> {
  final bool selectionMode;

  final bool enableFilter;

  ArtistSearchPage({this.selectionMode = false, this.enableFilter = true});

  void _onSelectArtist(ArtistModel artist) {
    if (!(Get.arguments is ArtistSearchArgs)) {
      return AppPages.toArtistDetailPage(artist);
    }

    ArtistSearchArgs args = Get.arguments;

    if (args.selectionMode) {
      Get.back(result: artist);
    } else {
      AppPages.toArtistDetailPage(artist);
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
            decoration:
                InputDecoration(border: InputBorder.none, hintText: 'Search'),
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
          : Text('Artists')),
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
          (this.enableFilter)
              ? IconButton(
                  icon: Icon(Icons.tune),
                  onPressed: () => Get.to(ArtistSearchFilterPage()))
              : Container()
        ]),
        body: Obx(
          () => ArtistListView(
            artists: controller.results.toList(),
            onSelect: this._onSelectArtist,
          ),
        ));
  }
}
