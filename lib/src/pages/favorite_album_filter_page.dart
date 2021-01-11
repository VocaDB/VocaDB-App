import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/constants.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/widgets.dart';

class FavoriteAlbumFilterPage extends GetView<FavoriteAlbumController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('filter'.tr)),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Obx(
                () => SimpleDropdownInput.fromJsonArray(
                  label: 'collectionStatus'.tr,
                  value: controller.purchaseStatuses.string,
                  onChanged: controller.purchaseStatuses,
                  json: [
                    {'name': 'Anything', 'value': ''},
                    {
                      'name': 'collectionStatus.Wishlisted'.tr,
                      'value': 'Wishlisted'
                    },
                    {'name': 'collectionStatus.Ordered'.tr, 'value': 'Ordered'},
                    {'name': 'collectionStatus.Owned'.tr, 'value': 'Owned'},
                  ],
                ),
              ),
              Obx(
                () => SimpleDropdownInput.fromJsonArray(
                  json: SimpleDropdownInput.buildDropdownItems(constAlbumTypes,
                      trPrefix: 'discType',
                      emptyItem: {'name': 'notSpecified'.tr, 'value': ''}),
                  label: 'discType'.tr,
                  value: controller.discType.string,
                  onChanged: controller.discType,
                ),
              ),
              Obx(() => SimpleDropdownInput.fromJsonArray(
                    json: [
                      {'name': 'Name'.tr, 'value': 'Name'},
                      {'name': 'AdditionDate'.tr, 'value': 'AdditionDate'}
                    ],
                    label: 'sort'.tr,
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
