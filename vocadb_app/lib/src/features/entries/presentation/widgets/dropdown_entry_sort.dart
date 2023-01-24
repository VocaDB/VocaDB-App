import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/dropdown_tile.dart';

class DropdownEntrySort extends StatelessWidget {
  const DropdownEntrySort({super.key, required this.value, this.onChanged});

  static const dropdownKey = Key('dropdown-entry-sort-key');

  final String value;

  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownTile(
      dropdownButtonKey: dropdownKey,
      value: value,
      label: 'Sort',
      onChanged: onChanged,
      items: const [
        DropdownMenuItem<String>(
          value: 'Name',
          child: Text('Name'),
        ),
        DropdownMenuItem<String>(
          value: 'Addition date',
          child: Text('AdditionDate'),
        ),
      ],
    );
  }
}
