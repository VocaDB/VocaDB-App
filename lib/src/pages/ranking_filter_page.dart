import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

class RankingFilterPage extends GetView<RankingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Settings')),
        body: ListView(
          children: [
            Obx(
              () => RadioButtonGroup(
                label: 'Filter by',
                value: controller.filterBy.string,
                onChanged: controller.filterBy,
                items: [
                  RadioButtonItem(label: 'Newly added', value: 'CreateDate'),
                  RadioButtonItem(
                      label: 'Newly published', value: 'PublishDate'),
                  RadioButtonItem(label: 'Popularity', value: 'Popularity')
                ],
              ),
            ),
            Divider(),
            Obx(() => RadioButtonGroup(
                  label: 'Vocalist',
                  value: controller.vocalist.string,
                  onChanged: controller.vocalist,
                  items: [
                    RadioButtonItem(label: 'All vocalists', value: 'Nothing'),
                    RadioButtonItem(label: 'Only Vocaloid', value: 'Vocaloid'),
                    RadioButtonItem(label: 'Only UTAU', value: 'UTAU'),
                    RadioButtonItem(label: 'Other vocalist', value: 'Other')
                  ],
                )),
          ],
        ));
  }
}
