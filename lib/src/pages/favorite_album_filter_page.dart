import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

class FavoriteAlbumFilterPage extends GetView<FavoriteAlbumController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Filter')),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Obx(
                () => SimpleDropdownInput.fromJsonArray(
                  label: 'Collection status',
                  value: controller.purchaseStatuses.string,
                  onChanged: controller.purchaseStatuses,
                  json: [
                    {'name': 'Anything', 'value': ''},
                    {'name': 'Wishlisted', 'value': 'Wishlisted'},
                    {'name': 'Ordered', 'value': 'Ordered'},
                    {'name': 'Owned', 'value': 'Owned'},
                  ],
                ),
              ),
              Obx(
                () => SimpleDropdownInput.fromJsonArray(
                  json: [
                    {'name': 'Not specified', 'value': 'Nothing'},
                    {'name': 'Original album', 'value': 'Original'},
                    {'name': 'Single', 'value': 'Single'},
                  ],
                  label: 'Album type',
                  value: controller.discType.string,
                  onChanged: controller.discType,
                ),
              ),
              Obx(() => SimpleDropdownInput.fromJsonArray(
                    json: [
                      {'name': 'Name', 'value': 'Name'},
                      {'name': 'Addition date', 'value': 'AdditionDate'}
                    ],
                    label: 'Sort',
                    value: controller.sort.string,
                    onChanged: controller.sort,
                  )),
              Divider(),
              Obx(() => ArtistInput(
                    values: controller.artists(),
                    onSelect: controller.artists.add,
                    onDeleted: controller.artists.remove,
                  )),
              Divider(),
              Obx(() => TagInput(
                    values: controller.tags(),
                    onSelect: controller.tags.add,
                    onDeleted: controller.tags.remove,
                  )),
            ],
          ),
        ));
  }
}
