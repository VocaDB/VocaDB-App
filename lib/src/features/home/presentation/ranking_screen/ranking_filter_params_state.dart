import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/home/domain/ranking_filter_params.dart';

class RankingFilterParamsState extends StateNotifier<RankingFilterParams> {
  RankingFilterParamsState()
      : super(const RankingFilterParams());
  Future<void> updateFilterBy(String value) async =>
      state = state.copyWith(filterBy: value);
  Future<void> updateVocalist(String value) async => state = state.copyWith(vocalist: value);
}

final rankingFilterParamsStateProvider = StateNotifierProvider.autoDispose<
    RankingFilterParamsState, RankingFilterParams>((ref) {
  return RankingFilterParamsState();
});
