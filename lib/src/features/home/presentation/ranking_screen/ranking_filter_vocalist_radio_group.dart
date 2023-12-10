import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/common_widgets/simple_radio_group.dart';
import 'package:vocadb_app/src/features/home/presentation/ranking_screen/ranking_filter_params_state.dart';

class RankingFilterVocalistRadioGroup extends ConsumerWidget {
  const RankingFilterVocalistRadioGroup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(rankingFilterParamsStateProvider);

    return SimpleRadioGroup(
        title: Text('Vocalist'),
        groupValue: value.vocalist,
        onChanged: (value) {
          ref.read(rankingFilterParamsStateProvider.notifier).updateVocalist(value!);
        },
        items: [
          SimpleRadioItem(name: 'All vocalists', value: 'Nothing'),
          SimpleRadioItem(name: 'Only Vocaloid', value: 'Vocaloid'),
          SimpleRadioItem(name: 'UTAU', value: 'UTAU'),
          SimpleRadioItem(name: 'Other', value: 'Other')
        ],
      );
  }
}
