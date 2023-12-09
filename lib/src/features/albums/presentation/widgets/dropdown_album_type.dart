import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/dropdown_tile.dart';

class DropdownAlbumType extends StatelessWidget {
  const DropdownAlbumType({super.key, required this.value, this.onChanged});

  static const dropdownKey = Key('dropdown-album-type-key');

  final String value;

  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownTile(
      dropdownButtonKey: dropdownKey,
      value: value,
      label: 'Album Type',
      onChanged: onChanged,
      items: const [
        DropdownMenuItem<String>(
          value: 'Unknown',
          child: Text('Anything'),
        ),
        DropdownMenuItem<String>(
          value: 'Album',
          child: Text('Original album'),
        ),
        DropdownMenuItem<String>(
          value: 'EP',
          child: Text('E.P.'),
        ),
        DropdownMenuItem<String>(
          value: 'SplitAlbum',
          child: Text('Split album'),
        ),
        DropdownMenuItem<String>(
          value: 'Compilation',
          child: Text('Compilation'),
        ),
        DropdownMenuItem<String>(
          value: 'Video',
          child: Text('Video'),
        ),
        DropdownMenuItem<String>(
          value: 'Artbook',
          child: Text('Artbook'),
        ),
        DropdownMenuItem<String>(
          value: 'Game',
          child: Text('Game'),
        ),
        DropdownMenuItem<String>(
          value: 'Fanmade',
          child: Text('Fanmade'),
        ),
        DropdownMenuItem<String>(
          value: 'Instrumental',
          child: Text('Instrumental'),
        ),
        DropdownMenuItem<String>(
          value: 'Other',
          child: Text('Other'),
        ),
      ],
    );
  }
}
