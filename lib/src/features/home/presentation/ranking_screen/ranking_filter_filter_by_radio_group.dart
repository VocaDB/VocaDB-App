import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/common_widgets/simple_radio_group.dart';
import 'package:vocadb_app/src/features/home/presentation/ranking_screen/ranking_filter_params_state.dart';

class RankingFilterFilterByRadioGroup extends ConsumerWidget {
  const RankingFilterFilterByRadioGroup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(rankingFilterParamsStateProvider);

    return SimpleRadioGroup(
        title: Text('Filter by'),
        groupValue: value.filterBy,
        onChanged: (value) {
          ref.read(rankingFilterParamsStateProvider.notifier).updateFilterBy(value!);
        },
        items: [
          SimpleRadioItem(name: 'Newly added', value: 'CreateDate'),
          SimpleRadioItem(name: 'Newly published', value: 'PublishDate'),
          SimpleRadioItem(name: 'Popularity', value: 'Popularity')
        ],
      );
  }
}
