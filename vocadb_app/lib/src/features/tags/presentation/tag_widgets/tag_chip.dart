import 'package:flutter/material.dart';

/// Tag chip widget
class TagChip extends StatelessWidget {
  const TagChip({
    super.key,
    required this.label,
    required this.onSelect,
    this.onDeleted,
    this.avatar,
  });

  /// A widget to display prior to the chip's label.
  final Widget? avatar;

  /// A string value display in tag. Return empty container if label value is null or empty.
  final String label;

  /// Called when the user taps the deleteIcon to delete the chip.
  final VoidCallback? onDeleted;

  /// Callback when pressed
  final VoidCallback? onSelect;

  @override
  Widget build(BuildContext context) {
    if (label.isEmpty) {
      return Container();
    }

    return Container(
      margin: const EdgeInsets.only(right: 4.0),
      child: InputChip(
        avatar: avatar,
        deleteIcon: (onDeleted == null) ? null : const Icon(Icons.cancel),
        label: Text(label),
        onPressed: onSelect,
        onDeleted: onDeleted,
      ),
    );
  }
}
