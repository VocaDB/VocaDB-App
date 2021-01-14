import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

class RankingFilterPage extends GetView<RankingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('filter'.tr)),
        body: ListView(
          children: [
            Obx(
              () => RadioButtonGroup(
                label: 'filterBy'.tr,
                value: controller.filterBy.string,
                onChanged: controller.filterBy,
                items: [
                  RadioButtonItem(
                      label: 'ranking.newlyAdded'.tr, value: 'CreateDate'),
                  RadioButtonItem(
                      label: 'ranking.newlyPublished'.tr, value: 'PublishDate'),
                  RadioButtonItem(
                      label: 'ranking.popularity'.tr, value: 'Popularity')
                ],
              ),
            ),
            Divider(),
            Obx(() => RadioButtonGroup(
                  label: 'vocalist'.tr,
                  value: controller.vocalist.string,
                  onChanged: controller.vocalist,
                  items: [
                    RadioButtonItem(
                        label: 'ranking.allVocalists'.tr, value: 'Nothing'),
                    RadioButtonItem(
                        label: 'ranking.onlyVocaloid'.tr, value: 'Vocaloid'),
                    RadioButtonItem(
                        label: 'ranking.onlyUTAU'.tr, value: 'UTAU'),
                    RadioButtonItem(
                        label: 'ranking.otherVocalist'.tr, value: 'Other')
                  ],
                )),
          ],
        ));
  }
}
