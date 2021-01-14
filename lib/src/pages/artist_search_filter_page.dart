import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/constants.dart';
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
                  json: SimpleDropdownInput.buildDropdownItems(constArtistTypes,
                      trPrefix: 'artistType',
                      emptyItem: {'name': 'notSpecified'.tr, 'value': ''}),
                  label: 'artistType'.tr,
                  value: controller.artistType.string,
                  onChanged: controller.artistType,
                ),
              ),
              Obx(
                () => SimpleDropdownInput.fromJsonArray(
                  json: SimpleDropdownInput.buildDropdownItems([
                    'Name',
                    'AdditionDate',
                    'AdditionDateAsc',
                    'ReleaseDate',
                    'SongCount',
                    'SongRating',
                    'FollowerCount',
                  ], trPrefix: 'sort'),
                  label: 'sort'.tr,
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
