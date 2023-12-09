import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/dropdown_tile.dart';

class DropdownArtistSort extends StatelessWidget {
  const DropdownArtistSort({super.key, required this.value, this.onChanged});

  static const dropdownKey = Key('dropdown-artist-sort-key');

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
          value: 'AdditionDate',
          child: Text('Addition date (descending)'),
        ),
        DropdownMenuItem<String>(
          value: 'AdditionDateAsc',
          child: Text('Addition date (ascending)'),
        ),
        DropdownMenuItem<String>(
          value: 'ReleaseDate',
          child: Text('Voicebank release date'),
        ),
        DropdownMenuItem<String>(
          value: 'SongCount',
          child: Text('Number of songs'),
        ),
        DropdownMenuItem<String>(
          value: 'SongRating',
          child: Text('Total song rating'),
        ),
        DropdownMenuItem<String>(
          value: 'FollowerCount',
          child: Text('Number of followers'),
        ),
      ],
    );
  }
}
