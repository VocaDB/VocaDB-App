import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/constants.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/widgets.dart';

class FavoriteArtistFilterPage extends GetView<FavoriteArtistController> {
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
                  json: SimpleDropdownInput.buildDropdownItems(constArtistTypes,
                      trPrefix: 'artistType',
                      emptyItem: {'name': 'notSpecified'.tr, 'value': ''}),
                  label: 'artistType'.tr,
                  value: controller.artistType.string,
                  onChanged: controller.artistType,
                ),
              ),
              Divider(),
              Obx(
                () => TagInput(
                  values: controller.tags(),
                  onSelect: controller.tags.add,
                  onDeleted: controller.tags.remove,
                ),
              ),
            ],
          ),
        ));
  }
}
