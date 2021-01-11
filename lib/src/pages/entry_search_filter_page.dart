import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/widgets.dart';

class EntrySearchFilterPage extends GetView<EntrySearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('filter'.tr),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => SimpleDropdownInput.fromJsonArray(
                json: [
                  {'name': 'anything'.tr, 'value': ''},
                  {'name': 'artist'.tr, 'value': 'Artist'},
                  {'name': 'album'.tr, 'value': 'Album'},
                  {'name': 'song'.tr, 'value': 'Song'},
                  {'name': 'tag'.tr, 'value': 'Tag'},
                  {'name': 'event'.tr, 'value': 'Event'}
                ],
                label: 'type'.tr,
                value: controller.entryType.string,
                onChanged: controller.entryType,
              ),
            ),
            Obx(
              () => SimpleDropdownInput.fromJsonArray(
                json: [
                  {'name': 'sort.Name'.tr, 'value': 'Name'},
                  {'name': 'sort.AdditionDate'.tr, 'value': 'AdditionDate'}
                ],
                label: 'sort'.tr,
                value: controller.sort.value,
                onChanged: controller.sort,
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
        ),
      ),
    );
  }
}
