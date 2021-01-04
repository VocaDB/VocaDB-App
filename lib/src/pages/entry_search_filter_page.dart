import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/widgets.dart';

class EntrySearchFilterPage extends GetView<EntrySearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => SimpleDropdownInput.fromJsonArray(
                json: [
                  {'name': 'Anything', 'value': ''},
                  {'name': 'Artist', 'value': 'Artist'},
                  {'name': 'Album', 'value': 'Album'},
                  {'name': 'Song', 'value': 'Song'},
                  {'name': 'Tag', 'value': 'Tag'},
                  {'name': 'Event', 'value': 'Event'}
                ],
                label: 'Type',
                value: controller.entryType.string,
                onChanged: controller.entryType,
              ),
            ),
            Obx(
              () => SimpleDropdownInput.fromJsonArray(
                json: [
                  {'name': 'Name', 'value': 'Name'},
                  {'name': 'Addition date', 'value': 'AdditionDate'}
                ],
                label: 'Sort',
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
