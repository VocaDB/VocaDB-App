import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/artists/presentation/widgets/dropdown_artist_types.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_widgets/tag_input.dart';
import 'package:vocadb_app/src/features/users/presentation/followed_artists_screen/followed_artists_list_params_state.dart';

class FollowedArtistsFilterScreen extends StatelessWidget {
  const FollowedArtistsFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filter'),
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(followedArtistsListParamsStateProvider);
            return ListView(
              children: [
                DropdownArtistTypes(
                  value: state.artistType ?? '',
                  onChanged: (value) => ref
                      .read(followedArtistsListParamsStateProvider.notifier)
                      .updateArtistType(value!),
                ),
                const Divider(),
                const TagInput(),
              ],
            );
          },
        ));
  }
}
