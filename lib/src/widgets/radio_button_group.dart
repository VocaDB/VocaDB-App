import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';

/// A widget to create simple radio button group.
class RadioButtonGroup extends StatelessWidget {
  /// String value that will display as text on header
  final String label;

  /// The current or selected value
  final String value;

  /// The list of mapping name/value to display as radio button
  final List<RadioButtonItem> items;

  /// A callback on value changed
  final ValueChanged onChanged;

  const RadioButtonGroup({this.label, this.value, this.items, this.onChanged});

  @override
  Widget build(BuildContext context) {
    List<Widget> radioItems = [];

    radioItems.add(ListTile(
      title: Text(this.label),
    ));

    radioItems.addAll(this
        .items
        .map((e) => ListTile(
              title: Text(e.label),
              leading: Radio(
                value: e.value,
                groupValue: this.value,
                onChanged: onChanged,
              ),
            ))
        .toList());

    return Column(
      children: radioItems,
    );
  }
}
