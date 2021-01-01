import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/widgets.dart';

class SongSearchPage extends GetView<SongSearchController> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Obx(() => (controller.openQuery.value)
                ? _buildTextInput(context)
                : Text('Songs')),
            actions: <Widget>[
              Obx(
                () => (controller.openQuery.value)
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () => controller.clearQuery())
                    : IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () => controller.openQuery(true)),
              ),
              IconButton(
                  icon: Icon(Icons.tune),
                  onPressed: () => Get.to(SongSearchFilterPage()))
            ]),
        body: Obx(
          () => SongListView(
            songs: controller.results.toList(),
          ),
        ));
  }
}
