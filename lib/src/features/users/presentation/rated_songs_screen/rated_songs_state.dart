import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:vocadb_app/src/features/settings/data/user_settings_repository.dart';
import 'package:vocadb_app/src/features/users/domain/rated_songs_list_params.dart';

class RatedSongsListParamsState extends StateNotifier<RatedSongsListParams> {
  RatedSongsListParamsState({
    String? query,
    List<int>? artistId,
    List<Artist>? artists,
    String lang = 'Default',
  }) : super(RatedSongsListParams(
          query: query,
          lang: lang,
          artistId: artistId,
          artists: artists,
        ));

  Future<void> updateRating(String value) async =>
      state = state.copyWith(rating: value);

  Future<void> updateQuery(String value) async =>
      state = state.copyWith(query: value);

  Future<void> updateSort(String value) async =>
      state = state.copyWith(sort: value);

  Future<void> addArtist(Artist value) async {
    // Prevent add duplicate value
    if (state.artistId != null && state.artistId!.contains(value.id)) {
      return;
    }

    state = state.copyWith(
      artistId: [...?state.artistId, value.id],
      artists: [...?state.artists, value],
    );
  }

  Future<void> removeArtist(Artist value) async {
    // Do nothing if artist is null or empty
    if (state.artistId == null || state.artistId!.isEmpty) {
      return;
    }

    final remainArtistId =
        state.artistId!.where((id) => id != value.id).toList();

    // if artist id after filter is empty, then set null both artistId and artists
    if (remainArtistId.isEmpty) {
      state = state.copyWith(
        artistId: null,
        artists: null,
      );
      return;
    }

    // Set remain artists after filter
    state = state.copyWith(
      artistId: remainArtistId,
      artists: state.artists!.where((a) => a.id != value.id).toList(),
    );
  }

  Future<void> clearQuery() async => state = state.copyWith(query: null);
}

final ratedSongsListParamsStateProvider = StateNotifierProvider.autoDispose<
    RatedSongsListParamsState, RatedSongsListParams>((ref) {
  final preferredLang = ref.watch(preferredStateChangesProvider);
  return RatedSongsListParamsState(lang: preferredLang.value!);
});
