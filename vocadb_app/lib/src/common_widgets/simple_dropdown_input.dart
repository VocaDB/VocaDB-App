import 'package:flutter/material.dart';

/// A widget to display dropdown input
class SimpleDropdownInput extends StatelessWidget {
  final List<SimpleDropdownItem> items;

  final Function(String?)? onChanged;

  final String value;

  final String label;

  const SimpleDropdownInput({
    super.key,
    required this.items,
    this.onChanged,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      trailing: DropdownButton(
        onChanged: onChanged,
        value: value,
        underline: Container(),
        style: const TextStyle(),
        items: items
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

class SimpleDropdownItem {
  final String name;

  final String value;

  const SimpleDropdownItem({required this.name, required this.value});
}
