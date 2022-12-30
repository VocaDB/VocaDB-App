import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/simple_dropdown_input.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_widgets/tag_input.dart';

// TODO : need implementation
class FollowedArtistsFilterScreen extends StatelessWidget {
  const FollowedArtistsFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
      ),
      body: ListView(
        children: [
          SimpleDropdownInput(
            value: 'Unknown',
            label: 'Artist type',
            onChanged: (value) {},
            items: const [
              SimpleDropdownItem(name: 'Not specified', value: 'Unknown'),
              SimpleDropdownItem(name: 'Vocaloid', value: 'Vocaloid'),
              SimpleDropdownItem(name: 'UTAU', value: 'UTAU'),
              SimpleDropdownItem(name: 'CeVIO', value: 'CeVIO'),
              SimpleDropdownItem(name: 'Synthesizer V', value: 'SynthesizerV'),
              SimpleDropdownItem(
                  name: 'Other voice synthesizer',
                  value: 'OtherVoiceSynthesizer'),
              SimpleDropdownItem(
                  name: 'Other vocalist', value: 'OtherVocalist'),
              SimpleDropdownItem(name: 'Producer', value: 'Producer'),
              SimpleDropdownItem(name: 'Cover artist', value: 'CoverArtist'),
              SimpleDropdownItem(name: 'Animation producer', value: 'Animator'),
              SimpleDropdownItem(name: 'Illustrator', value: 'Illustrator'),
              SimpleDropdownItem(name: 'Circle', value: 'Circle'),
              SimpleDropdownItem(name: 'Label', value: 'Label'),
              SimpleDropdownItem(name: 'OtherGroup', value: 'Other group'),
              SimpleDropdownItem(name: 'Lyricist', value: 'Lyricist'),
              SimpleDropdownItem(
                  name: 'Other individual', value: 'OtherIndividual'),
            ],
          ),
          const Divider(),
          const TagInput(),
        ],
      ),
    );
  }
}
