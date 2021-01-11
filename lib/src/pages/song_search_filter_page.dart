import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/constants.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/src/widgets/tag_input.dart';
import 'package:vocadb_app/widgets.dart';

class SongSearchFilterPage extends GetView<SongSearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('filter'.tr)),
        body: ListView(
          children: [
            Obx(
              () => SimpleDropdownInput.fromJsonArray(
                label: 'songType'.tr,
                value: controller.songType.string,
                onChanged: controller.songType,
                json: SimpleDropdownInput.buildDropdownItems(constSongTypes,
                    trPrefix: 'songType',
                    emptyItem: {'name': 'notSpecified'.tr, 'value': ''}),
              ),
            ),
            Obx(
              () => SimpleDropdownInput.fromJsonArray(
                label: 'sort'.tr,
                value: controller.sort.string,
                onChanged: controller.sort,
                json: SimpleDropdownInput.buildDropdownItems([
                  'Name',
                  'AdditionDate',
                  'PublishDate',
                  'FavoritedTimes',
                  'RatingScore'
                ], trPrefix: 'sort'),
              ),
            ),
            Divider(),
            Obx(
              () => ArtistInput(
                values: controller.artists.toList(),
                onSelect: controller.artists.add,
                onDeleted: controller.artists.remove,
              ),
            ),
            Divider(),
            Obx(
              () => TagInput(
                values: controller.tags.toList(),
                onSelect: controller.tags.add,
                onDeleted: controller.tags.remove,
              ),
            ),
          ],
        ));
  }
}
