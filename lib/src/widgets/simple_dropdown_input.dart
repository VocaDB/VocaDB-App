import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:get/get.dart';

/// A widget to display dropdown input with key and value are string
class SimpleDropdownInput extends StatelessWidget {
  final List<SimpleDropdownItem> items;

  final Function onChanged;

  final String value;

  final String label;

  const SimpleDropdownInput(
      {@required this.items, this.onChanged, this.value, @required this.label})
      : assert(items != null),
        assert(label != null);

  static List<Map<String, String>> buildDropdownItems(List<String> values,
      {String trPrefix = '', Map<String, String> emptyItem}) {
    List<Map<String, String>> items = [];

    if (emptyItem != null) {
      items.add(emptyItem);
    }

    items.addAll(
        values.map((e) => {'name': '$trPrefix.$e'.tr, 'value': e}).toList());
    return items;
  }

  /// An array input must be map that contains *name* and *value* as key
  SimpleDropdownInput.fromJsonArray(
      {@required List<Map<String, String>> json,
      this.onChanged,
      this.value,
      @required this.label})
      : this.items = json
            .map((e) => SimpleDropdownItem(name: e['name'], value: e['value']))
            .toList(),
        assert(label != null);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.label),
      trailing: DropdownButton(
        onChanged: this.onChanged,
        value: this.value,
        underline: Container(),
        style: TextStyle(),
        items: this
            .items
            .map((e) => DropdownMenuItem<String>(
                  value: e.value,
                  child: Text(
                    e.name,
                  ),
                ))
            .toList(),
      ),
    );
  }
}
