import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/dropdown_tile.dart';

class DropdownEntryTypes extends StatelessWidget {
  const DropdownEntryTypes({super.key, required this.value, this.onChanged});

  static const dropdownKey = Key('dropdown-entry-types-key');

  final String value;

  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownTile(
      dropdownButtonKey: dropdownKey,
      value: value,
      label: 'Entry type',
      onChanged: onChanged,
      items: const [
        DropdownMenuItem<String>(
          value: '',
          child: Text('Anything'),
        ),
        DropdownMenuItem<String>(
          value: 'Song',
          child: Text('Song'),
        ),
        DropdownMenuItem<String>(
          value: 'Artist',
          child: Text('Artist'),
        ),
        DropdownMenuItem<String>(
          value: 'Album',
          child: Text('Album'),
        ),
        DropdownMenuItem<String>(
          value: 'Event',
          child: Text('Event'),
        ),
      ],
    );
  }
}
