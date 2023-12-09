import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/dropdown_tile.dart';

class DropdownMediaType extends StatelessWidget {
  const DropdownMediaType({super.key, required this.value, this.onChanged});

  static const dropdownKey = Key('dropdown-media-type-key');

  final String value;

  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownTile(
      dropdownButtonKey: dropdownKey,
      value: value,
      label: 'Media Type',
      onChanged: onChanged,
      items: const [
        DropdownMenuItem<String>(
          value: '',
          child: Text('Anything'),
        ),
        DropdownMenuItem<String>(
          value: 'PhysicalDisc',
          child: Text('Physical disc'),
        ),
        DropdownMenuItem<String>(
          value: 'DigitalDownload',
          child: Text('Digital download'),
        ),
        DropdownMenuItem<String>(
          value: 'Other',
          child: Text('Unpsecified'),
        ),
      ],
    );
  }
}
