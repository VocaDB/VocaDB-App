import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/widgets.dart';

class ArtistSearchFilterPage extends GetView<ArtistSearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Filter')),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => SimpleDropdownInput.fromJsonArray(
                  json: [
                    {'name': 'Not specified', 'value': 'Nothing'},
                    {'name': 'Circle', 'value': 'Circle'},
                    {'name': 'Vocaloid', 'value': 'Vocaloid'},
                  ],
                  label: 'Artist type',
                  value: controller.artistType.string,
                  onChanged: controller.artistType,
                ),
              ),
              Obx(
                () => SimpleDropdownInput.fromJsonArray(
                  json: [
                    {'name': 'Name', 'value': 'Name'},
                    {'name': 'Addition date', 'value': 'AdditionDate'}
                  ],
                  label: 'Sort',
                  value: controller.sort.string,
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
        ));
  }
}
