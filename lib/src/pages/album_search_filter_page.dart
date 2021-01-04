import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/widgets.dart';

class AlbumSearchFilterPage extends GetView<AlbumSearchController> {
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
                    {'name': 'Original album', 'value': 'Original'},
                    {'name': 'Single', 'value': 'Single'},
                  ],
                  label: 'Album type',
                  value: controller.discType.string,
                  onChanged: controller.discType,
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
          ),
        ));
  }
}
