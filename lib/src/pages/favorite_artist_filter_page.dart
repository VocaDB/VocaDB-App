import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

class FavoriteArtistFilterPage extends GetView<FavoriteArtistController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Filter')),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
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
              Divider(),
              Obx(
                () => TagInput(
                  values: controller.tags(),
                  onSelect: controller.tags.add,
                  onDeleted: controller.tags.remove,
                ),
              ),
            ],
          ),
        ));
  }
}
