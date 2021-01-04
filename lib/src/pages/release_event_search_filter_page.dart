import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/widgets.dart';

class ReleaseEventSearchFilterPage
    extends GetView<ReleaseEventSearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Filter')),
        body: ListView(
          children: [
            Obx(
              () => SimpleDropdownInput.fromJsonArray(
                label: 'Category',
                value: controller.category.string,
                onChanged: controller.category,
                json: [
                  {'name': 'Not specified', 'value': 'Nothing'},
                  {'name': 'Album release fair', 'value': 'AlbumReleaseFair'},
                  {'name': 'Club', 'value': 'Club'},
                  {'name': 'Contest', 'value': 'Contest'},
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
                  {'name': 'Date', 'value': 'Date'},
                ],
              ),
            ),
            Divider(),
            Obx(
              () => DateRangeInput(
                fromDateValue: controller.fromDate.value,
                toDateValue: controller.toDate.value,
                onFromDateChanged: (v) => controller.fromDate(v),
                onToDateChanged: (v) => controller.toDate(v),
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
