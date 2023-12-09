import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/dropdown_tile.dart';

class DropdownArtistTypes extends StatelessWidget {
  const DropdownArtistTypes({super.key, required this.value, this.onChanged});

  static const dropdownKey = Key('dropdown-artist-types-key');

  final String value;

  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownTile(
      dropdownButtonKey: dropdownKey,
      value: value,
      label: 'Artist Types',
      onChanged: onChanged,
      items: const [
        DropdownMenuItem<String>(
          value: '',
          child: Text('Not specified'),
        ),
        DropdownMenuItem<String>(
          enabled: false,
          alignment: AlignmentDirectional.center,
          child:
              Text('Vocalist', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        DropdownMenuItem<String>(
          value: 'Vocaloid',
          child: Text('Vocaloid'),
        ),
        DropdownMenuItem<String>(
          value: 'UTAU',
          child: Text('UTAU'),
        ),
        DropdownMenuItem<String>(
          value: 'CeVIO',
          child: Text('CeVIO'),
        ),
        DropdownMenuItem<String>(
          value: 'SynthesizerV',
          child: Text('Synthesizer V'),
        ),
        DropdownMenuItem<String>(
          value: 'OtherVoiceSynthesizer',
          child: Text('Other voice synthesizer'),
        ),
        DropdownMenuItem<String>(
          value: 'OtherVocalist',
          child: Text('Other vocalist'),
        ),
        DropdownMenuItem<String>(
          enabled: false,
          alignment: AlignmentDirectional.center,
          child:
              Text('Producer', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        DropdownMenuItem<String>(
          value: 'Producer',
          child: Text('Music Producer'),
        ),
        DropdownMenuItem<String>(
          value: 'CoverArtist',
          child: Text('Cover artist'),
        ),
        DropdownMenuItem<String>(
          value: 'Animator',
          child: Text('Animation producer'),
        ),
        DropdownMenuItem<String>(
          value: 'Illustrator',
          child: Text('Illustrator'),
        ),
        DropdownMenuItem<String>(
          enabled: false,
          alignment: AlignmentDirectional.center,
          child: Text('Group', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        DropdownMenuItem<String>(
          value: 'Circle',
          child: Text('Circle'),
        ),
        DropdownMenuItem<String>(
          value: 'Label',
          child: Text('Label'),
        ),
        DropdownMenuItem<String>(
          value: 'OtherGroup',
          child: Text('Other group'),
        ),
        DropdownMenuItem<String>(
          enabled: false,
          alignment: AlignmentDirectional.center,
          child: Text('Other', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        DropdownMenuItem<String>(
          value: 'Lyricist',
          child: Text('Lyricist'),
        ),
        DropdownMenuItem<String>(
          value: 'OtherIndividual',
          child: Text('Other individual'),
        ),
      ],
    );
  }
}
