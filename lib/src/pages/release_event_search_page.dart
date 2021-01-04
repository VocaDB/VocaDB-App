import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/widgets.dart';

class ReleaseEventSearchPage extends GetView<ReleaseEventSearchController> {
  Widget _buildTextInput(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: controller.textSearchController,
            onChanged: controller.query,
            style: Theme.of(context).primaryTextTheme.headline6,
            autofocus: true,
            decoration:
                InputDecoration(border: InputBorder.none, hintText: 'Search'),
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
          : Text('Events')),
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
          IconButton(
              icon: Icon(Icons.tune),
              onPressed: () => Get.to(ReleaseEventSearchFilterPage()))
        ]),
        body: Obx(
          () => ReleaseEventListView(
            events: controller.results.toList(),
          ),
        ));
  }
}
