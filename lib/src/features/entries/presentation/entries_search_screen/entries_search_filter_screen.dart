import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/entries/domain/entries_list_params_state.dart';
import 'package:vocadb_app/src/features/entries/presentation/widgets/dropdown_entry_sort.dart';
import 'package:vocadb_app/src/features/entries/presentation/widgets/dropdown_entry_type.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_widgets/tag_input.dart';

class EntriesSearchFilter extends StatelessWidget {
  const EntriesSearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(entriesListParamsStateProvider);

          return ListView(
            children: [
              DropdownEntryTypes(
                value: state.entryTypes ?? '',
                onChanged: (value) => ref
                    .read(entriesListParamsStateProvider.notifier)
                    .updateEntryTypes(value!),
              ),
              DropdownEntrySort(
                value: 'Name',
                onChanged: (value) => ref
                    .read(entriesListParamsStateProvider.notifier)
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
