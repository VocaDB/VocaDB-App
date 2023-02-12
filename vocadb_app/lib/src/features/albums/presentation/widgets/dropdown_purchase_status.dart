import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/dropdown_tile.dart';

class DropdownPurchaseStatus extends StatelessWidget {
  const DropdownPurchaseStatus(
      {super.key, required this.value, this.onChanged});

  static const dropdownKey = Key('dropdown-purchase-status-key');

  final String value;

  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownTile(
      dropdownButtonKey: dropdownKey,
      value: value,
      label: 'Purchase status',
      onChanged: onChanged,
      items: const [
        DropdownMenuItem<String>(
          value: 'All',
          child: Text('All'),
        ),
        DropdownMenuItem<String>(
          value: 'Wishlisted',
          child: Text('Wishlisted'),
        ),
        DropdownMenuItem<String>(
          value: 'Ordered',
          child: Text('Ordered'),
        ),
        DropdownMenuItem<String>(
          value: 'Owned',
          child: Text('Owned'),
        ),
      ],
    );
  }
}