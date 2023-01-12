import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/common_widgets/dropdown_tile.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_input/artist_input.dart';
import 'package:vocadb_app/src/features/users/presentation/rated_songs_screen/rated_songs_state.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_widgets/tag_input.dart';

class RatedSongsFilterScreen extends StatelessWidget {
  const RatedSongsFilterScreen({super.key});

  static const ratingKey = Key('rating-key');
  static const sortKey = Key('sort-key');

  @override
  Widget build(BuildContext context) {
    // ratedSongsListParamsStateProvider
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(ratedSongsListParamsStateProvider);

          return ListView(
            children: [
              DropdownTile(
                dropdownButtonKey: ratingKey,
                value: state.rating,
                label: 'Rating',
                onChanged: (value) {
                  ref
                      .read(ratedSongsListParamsStateProvider.notifier)
                      .updateRating(value!);
                },
                items: const [
                  DropdownMenuItem<String>(
                    value: 'Nothing',
                    child: Text('Anything'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Like',
                    child: Text('Like'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Favorite',
                    child: Text('Favorite'),
                  ),
                ],
              ),
              DropdownTile(
                dropdownButtonKey: sortKey,
                value: state.sort,
                label: 'Sort',
                onChanged: (value) {
                  ref
                      .read(ratedSongsListParamsStateProvider.notifier)
                      .updateSort(value!);
                },
                items: const [
                  DropdownMenuItem<String>(
                    value: 'Name',
                    child: Text('Name'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'AdditionDate',
                    child: Text('Addition date'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'PublishDate',
                    child: Text('Publish date'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'FavoritedTimes',
                    child: Text('Times favorited'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'RatingDate',
                    child: Text('Rating date'),
                  ),
                ],
              ),
              const Divider(),
              const ArtistInput(),
              const Divider(),
              const TagInput(),
            ],
          );
        },
      ),
    );
  }
}
