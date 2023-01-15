import 'package:flutter/material.dart';

class SectionDivider extends StatelessWidget {
  const SectionDivider(
      {super.key, required this.visible, required this.child, this.title});

  final bool visible;

  final Widget child;

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          (title == null || title!.isEmpty)
              ? Container()
              : ListTile(title: Text(title!)),
          child,
        ],
      ),
    );
  }
}
