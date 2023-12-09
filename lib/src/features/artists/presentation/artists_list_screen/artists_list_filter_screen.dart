import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/artists/presentation/artists_list_screen/artists_list_params_state.dart';
import 'package:vocadb_app/src/features/artists/presentation/widgets/dropdown_artist_types.dart';
import 'package:vocadb_app/src/features/artists/presentation/widgets/dropdown_artist_sort.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_widgets/tag_input.dart';

class ArtistsFilterScreen extends StatelessWidget {
  const ArtistsFilterScreen(
      {super.key, this.onSortChanged, this.onArtistTypesChanged});

  final Function(String?)? onArtistTypesChanged;

  final Function(String?)? onSortChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(artistsListParamsStateProvider);

          return ListView(
            children: [
              DropdownArtistTypes(
                value: state.artistTypes ?? '',
                onChanged: (value) =>
                    onArtistTypesChanged?.call(value) ??
                    ref
                        .read(artistsListParamsStateProvider.notifier)
                        .updateArtistTypes(value!),
              ),
              DropdownArtistSort(
                value: 'Name',
                onChanged: (value) =>
                    onArtistTypesChanged?.call(value) ??
                    ref
                        .read(artistsListParamsStateProvider.notifier)
                        .updateSort(value!),
              ),
              const Divider(),
              const TagInput(),
            ],
          );
        },
      ),
    );
  }
}
