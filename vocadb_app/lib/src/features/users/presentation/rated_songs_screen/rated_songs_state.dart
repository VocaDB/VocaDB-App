import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/users/domain/rated_songs_list_params.dart';

class ReatedSongsListParamsState extends StateNotifier<RatedSongsListParams> {
  ReatedSongsListParamsState() : super(const RatedSongsListParams());
  void updateRating(String value) => state = state.copyWith(rating: value);
  void updateQuery(String value) => state = state.copyWith(query: value);
  void updateSort(String value) => state = state.copyWith(sort: value);
  void clearQuery() => state = state.copyWith(query: null);
}

final ratedSongsListParamsStateProvider =
    StateNotifierProvider<ReatedSongsListParamsState, RatedSongsListParams>(
        (ref) {
  return ReatedSongsListParamsState();
});
