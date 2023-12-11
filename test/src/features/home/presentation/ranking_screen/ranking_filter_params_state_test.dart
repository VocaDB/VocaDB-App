import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/home/domain/ranking_filter_params.dart';
import 'package:vocadb_app/src/features/home/presentation/ranking_screen/ranking_filter_params_state.dart';

void main() {

  group('RankingFilterParamsState', () { 

    late RankingFilterParamsState state;

    setUp(() {
      state = RankingFilterParamsState();
    });

    test('updateFilterBy(String value) successfully updates the state with value of filterBy', () async {
      expectLater(
        state.stream,
        emits(const RankingFilterParams(filterBy: 'Popularity'))
      );

      await state.updateFilterBy('Popularity');
    });

    test('updateVocalist(String value) successfully updates the state with value of vocalist', () async {
      expectLater(
        state.stream,
        emits(const RankingFilterParams(filterBy: 'Popularity'))
      );

      await state.updateFilterBy('Popularity');
    });


  });

}