import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/artists/presentation/widgets/dropdown_artist_types.dart';
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
          DropdownArtistTypes(
            value: '',
            onChanged: (value) {},
          ),
          const Divider(),
          const TagInput(),
        ],
      ),
    );
  }
}
