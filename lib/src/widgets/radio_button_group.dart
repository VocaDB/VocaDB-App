import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';

class RadioButtonGroup extends StatelessWidget {
  final String label;

  final String value;

  final List<RadioButtonItem> items;

  const RadioButtonGroup({this.label, this.value, this.items});

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
                onChanged: (v) => {},
              ),
            ))
        .toList());

    return Column(
      children: radioItems,
    );
  }
}
