import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/simple_dropdown_input.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_input/artist_input.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_widgets/tag_input.dart';

// TODO : need implementation
class RatedSongsFilterScreen extends StatelessWidget {
  const RatedSongsFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
      ),
      body: ListView(
        children: [
          SimpleDropdownInput(
            value: '',
            label: 'Rating',
            onChanged: (value) {},
            items: const [
              SimpleDropdownItem(name: 'Anything', value: ''),
              SimpleDropdownItem(name: 'Like', value: 'Like'),
              SimpleDropdownItem(name: 'Favorite', value: 'Favorite'),
            ],
          ),
          SimpleDropdownInput(
            value: 'RatingDate',
            label: 'Sort by',
            onChanged: (value) {},
            items: const [
              // None, Name, AdditionDate, PublishDate, FavoritedTimes, RatingScore, RatingDate
              SimpleDropdownItem(name: 'Name', value: 'Name'),
              SimpleDropdownItem(name: 'Addition date', value: 'AdditionDate'),
              SimpleDropdownItem(name: 'Publish date', value: 'PublishDate'),
              SimpleDropdownItem(
                  name: 'Times favorited', value: 'FavoritedTimes'),
              SimpleDropdownItem(name: 'Rating score', value: 'RatingScore'),
              SimpleDropdownItem(name: 'Rating date', value: 'RatingDate'),
            ],
          ),
          const Divider(),
          const ArtistInput(),
          const Divider(),
          const TagInput(),
        ],
      ),
    );
  }
}
