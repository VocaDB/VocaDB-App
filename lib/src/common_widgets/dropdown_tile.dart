import 'package:flutter/material.dart';

class DropdownTile extends StatelessWidget {
  const DropdownTile({
    super.key,
    required this.dropdownButtonKey,
    required this.items,
    this.onChanged,
    required this.value,
    required this.label,
  });

  final List<DropdownMenuItem<String>> items;

  final Function(String?)? onChanged;

  final String value;

  final String label;

  final Key dropdownButtonKey;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      trailing: DropdownButton(
        key: dropdownButtonKey,
        onChanged: onChanged,
        value: value,
        underline: Container(),
        style: const TextStyle(),
        items: items,
      ),
    );
  }
}
