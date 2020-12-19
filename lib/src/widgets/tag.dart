import 'package:flutter/material.dart';

/// Tag widget
class Tag extends StatelessWidget {
  /// A string value display in tag.
  final String label;

  /// Callback when pressed
  final VoidCallback onPressed;

  const Tag({this.label, this.onPressed}) : assert(label != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4.0),
      child: InputChip(
        label: Text(this.label),
        onPressed: this.onPressed,
      ),
    );
  }
}
