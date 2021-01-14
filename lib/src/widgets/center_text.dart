import 'package:flutter/material.dart';

class CenterText extends StatelessWidget {
  final String text;

  final bool isExpanded;

  const CenterText(this.text, {this.isExpanded = false});

  @override
  Widget build(BuildContext context) {
    if (isExpanded) {
      return Expanded(
        child: Center(
          child: Text(text),
        ),
      );
    }
    return Center(
      child: Text(text),
    );
  }
}
