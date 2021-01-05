import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A builder widget to build individual pages with own view and state.
/// Used on any page that can be duplicated but with different id.
/// Such as detail pages.
class PageBuilder<T extends GetxController> extends StatelessWidget {
  final GetxController controller;

  final Function(T) builder;

  /// An unique string value for seperated state.
  final String tag;

  const PageBuilder({Key key, this.controller, this.builder, this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      tag: this.tag,
      global: false,
      init: controller,
      dispose: (_) => controller.onClose(),
      builder: builder,
    );
  }
}
