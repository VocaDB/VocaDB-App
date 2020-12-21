import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';

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
