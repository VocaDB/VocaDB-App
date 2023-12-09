import 'package:flutter/material.dart';

class SimpleRadioGroup extends StatelessWidget {
  const SimpleRadioGroup(
      {super.key,
      this.groupValue,
      required this.title,
      this.onChanged,
      required this.items});

  final String? groupValue;

  final Widget title;

  final Function(String?)? onChanged;

  final List<SimpleRadioItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: title,
        ),
        ...items
            .map(
              (i) => RadioListTile<String>(
                title: Text(i.name),
                value: i.value,
                groupValue: groupValue,
                onChanged: onChanged,
              ),
            )
            .toList(),
      ],
    );
  }
}

class SimpleRadioItem {
  final String name;

  final String value;

  const SimpleRadioItem({required this.name, required this.value});
}
