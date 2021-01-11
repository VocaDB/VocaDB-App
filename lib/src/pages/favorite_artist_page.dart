import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/routes.dart';
import 'package:vocadb_app/widgets.dart';

class FavoriteArtistPage extends GetView<FavoriteArtistController> {
  void _onTapArtist(ArtistModel artist) => AppPages.toArtistDetailPage(artist);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('favoriteArtists'.tr), actions: <Widget>[
          IconButton(
              icon: Icon(Icons.tune),
              onPressed: () => Get.to(FavoriteArtistFilterPage()))
        ]),
        body: Obx(
          () => ArtistListView(
            artists: controller.results().map((e) => e.artist).toList(),
            onSelect: this._onTapArtist,
          ),
        ));
  }
}
