import 'package:flutter/material.dart';

class SectionDivider extends StatelessWidget {
  const SectionDivider({super.key, required this.visible, required this.child});

  final bool visible;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Column(
        children: [
          const Divider(),
          child,
        ],
      ),
    );
  }
}
