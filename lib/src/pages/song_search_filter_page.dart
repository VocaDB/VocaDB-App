import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/src/widgets/tag_input.dart';
import 'package:vocadb_app/widgets.dart';

class SongSearchFilterPage extends GetView<SongSearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Filter')),
        body: ListView(
          children: [
            Obx(
              () => SimpleDropdownInput.fromJsonArray(
                label: 'Song type',
                value: controller.songType.string,
                onChanged: controller.songType,
                json: [
                  {'name': 'Not specified', 'value': 'Nothing'},
                  {'name': 'Original song', 'value': 'Original'},
                  {'name': 'Remaster', 'value': 'Remaster'},
                  {'name': 'Cover', 'value': 'Cover'},
                ],
              ),
            ),
            Obx(
              () => SimpleDropdownInput.fromJsonArray(
                label: 'Sort',
                value: controller.sort.string,
                onChanged: controller.sort,
                json: [
                  {'name': 'Not specified', 'value': 'Nothing'},
                  {'name': 'Name', 'value': 'Name'},
                  {'name': 'Addition date', 'value': 'AdditionDate'},
                  {'name': 'Rating score', 'value': 'Rating'},
                ],
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
