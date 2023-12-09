import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/common_widgets/async_value_widget.dart';
import 'package:vocadb_app/src/common_widgets/search_appbar.dart';
import 'package:vocadb_app/src/features/entries/data/entry_repository.dart';
import 'package:vocadb_app/src/features/entries/domain/entries_list_params_state.dart';
import 'package:vocadb_app/src/features/entries/presentation/entries_search_screen/entries_search_result.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

class EntriesSearchScreen extends ConsumerWidget {
  const EntriesSearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: SearchAppBar(
        showTextInput: true,
        onSubmitted: (text) {
          ref.read(entriesListParamsStateProvider.notifier).updateQuery(text);
        },
        onCleared: () {
          ref.read(entriesListParamsStateProvider.notifier).clearQuery();
        },
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {
              GoRouter.of(context).pushNamed(AppRoute.entriesFilter.name);
            },
          ),
        ],
      ),
      body: Consumer(builder: ((context, ref, child) {
        final value = ref.watch(entriesListProvider);
        return AsyncValueWidget(
            value: value,
            data: (entries) {
              return EntriesSearchResult(
                entries: entries,
              );
            });
      })),
    );
  }
}
