import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/arguments.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/routes.dart';
import 'package:vocadb_app/widgets.dart';

class TagSearchPage extends GetView<TagSearchController> {
  const TagSearchPage();

  void _onSelectTag(TagModel tag) {
    if (!(Get.arguments is TagSearchArgs)) {
      return AppPages.toTagDetailPage(tag);
    }

    TagSearchArgs args = Get.arguments;

    if (args.selectionMode) {
      Get.back(result: tag);
    } else {
      AppPages.toTagDetailPage(tag);
    }
  }

  Widget _buildTextInput(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: controller.textSearchController,
            onChanged: controller.query,
            style: Theme.of(context).primaryTextTheme.headline6,
            autofocus: true,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'search'.tr),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 100),
      child: Obx(() => (controller.openQuery.value)
          ? _buildTextInput(context)
          : Text((controller.category.string == '')
              ? 'tags'.tr
              : controller.category.string)),
    );
  }

  Widget _buildSearchAction(BuildContext context) {
    return Obx(
      () => (controller.openQuery.value)
          ? IconButton(
              icon: Icon(Icons.clear), onPressed: () => controller.clearQuery())
          : IconButton(
              icon: Icon(Icons.search),
              onPressed: () => controller.openQuery(true)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: _buildTitle(context), actions: <Widget>[
          _buildSearchAction(context),
        ]),
        body: Obx(
          () => (controller.initialLoading.value)
              ? CenterLoading()
              : TagListView(
                  tags: controller.results.toList(),
                  onSelect: this._onSelectTag,
                  onReachLastItem: controller.onReachLastItem,
                ),
        ));
  }
}
