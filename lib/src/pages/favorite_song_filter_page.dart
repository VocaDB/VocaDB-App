import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

class FavoriteSongFilterPage extends GetView<FavoriteSongController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Filter')),
        body: ListView(
          children: [
            Obx(
              () => SimpleDropdownInput.fromJsonArray(
                label: 'Rating',
                value: controller.rating.string,
                onChanged: controller.rating,
                json: [
                  {'name': 'Anything', 'value': ''},
                  {'name': 'Like', 'value': 'Like'},
                  {'name': 'Favorite', 'value': 'Favorite'},
                ],
              ),
            ),
            Obx(() => SimpleDropdownInput.fromJsonArray(
                  label: 'Sort',
                  value: controller.sort.string,
                  onChanged: controller.sort,
                  json: [
                    {'name': 'Not specified', 'value': 'Nothing'},
                    {'name': 'Name', 'value': 'Name'},
                    {'name': 'Addition date', 'value': 'AdditionDate'},
                    {'name': 'Rating date', 'value': 'RatingDate'},
                  ],
                )),
            Obx(() => SwitchListTile(
                  title: const Text('Group by rating'),
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
