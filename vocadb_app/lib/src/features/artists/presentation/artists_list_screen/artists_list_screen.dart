import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/common_widgets/async_value_widget.dart';
import 'package:vocadb_app/src/common_widgets/search_appbar.dart';
import 'package:vocadb_app/src/features/artists/data/artist_repository.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:vocadb_app/src/features/artists/presentation/artists_list/artist_list_view.dart';
import 'package:vocadb_app/src/features/artists/presentation/artists_list_screen/artists_list_params_state.dart';
import 'package:vocadb_app/src/routing/app_route_context.dart';

class ArtistsListScreen extends ConsumerWidget {
  const ArtistsListScreen({super.key, this.onSelectArtist});

  static const filterKey = Key('icon-filter-key');

  final Function(Artist)? onSelectArtist;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: SearchAppBar(
        titleText: 'Artists',
        actions: [
          IconButton(
            key: filterKey,
            icon: const Icon(Icons.tune),
            onPressed: () => context.goArtistsListFilterScreen(),
          ),
        ],
        onSubmitted: (value) {
          ref.read(artistsListParamsStateProvider.notifier).updateQuery(value);
        },
        onCleared: () {
          ref.read(artistsListParamsStateProvider.notifier).clearQuery();
        },
      ),
      body: Consumer(builder: ((context, ref, child) {
        final value = ref.watch(artistsListProvider);
        return AsyncValueWidget(
            value: value,
            data: (data) {
              return ArtistListView(
                artists: data,
                onSelect: (artist) => onSelectArtist?.call(artist),
              );
            });
      })),
    );
  }
}

// State
final artistsListProvider = FutureProvider.autoDispose<List<Artist>>((ref) {
  final params = ref.watch(artistsListParamsStateProvider);
  final artistRepository = ref.watch(artistRepositoryProvider);
  return artistRepository.fetchList(params: params);
});
