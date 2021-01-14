import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/widgets.dart';

class FavoriteSongFilterPage extends GetView<FavoriteSongController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('filter'.tr)),
        body: ListView(
          children: [
            Obx(
              () => SimpleDropdownInput.fromJsonArray(
                label: 'Rating',
                value: controller.rating.string,
                onChanged: controller.rating,
                json: [
                  {'name': 'anything'.tr, 'value': ''},
                  {'name': 'Like', 'value': 'Like'},
                  {'name': 'Favorite', 'value': 'Favorite'},
                ],
              ),
            ),
            Obx(
              () => SimpleDropdownInput.fromJsonArray(
                json: SimpleDropdownInput.buildDropdownItems([
                  'Name',
                  'AdditionDate',
                  'PublishDate',
                  'RatingScore',
                  'FavoritedTimes',
                  'RatingDate'
                ], trPrefix: 'sort'),
                label: 'sort'.tr,
                value: controller.sort.string,
                onChanged: controller.sort,
              ),
            ),
            Obx(() => SwitchListTile(
                  title: Text('groupByRating'.tr),
                  value: controller.groupByRating.value,
                  onChanged: controller.groupByRating,
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
        ));
  }
}
