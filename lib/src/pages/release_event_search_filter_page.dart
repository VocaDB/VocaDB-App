import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/constants.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/widgets.dart';

class ReleaseEventSearchFilterPage
    extends GetView<ReleaseEventSearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('filter'.tr)),
        body: ListView(
          children: [
            Obx(
              () => SimpleDropdownInput.fromJsonArray(
                json: SimpleDropdownInput.buildDropdownItems(
                    constEventCategories,
                    trPrefix: 'eventCategory',
                    emptyItem: {'name': 'notSpecified'.tr, 'value': ''}),
                label: 'category'.tr,
                value: controller.category.string,
                onChanged: controller.category,
              ),
            ),
            Obx(
              () => SimpleDropdownInput.fromJsonArray(
                json: SimpleDropdownInput.buildDropdownItems([
                  'Name',
                  'Date',
                  'AdditionDate',
                ], trPrefix: 'sort'),
                label: 'sort'.tr,
                value: controller.sort.string,
                onChanged: controller.sort,
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
