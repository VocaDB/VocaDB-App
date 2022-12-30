import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/common_widgets/search_appbar.dart';
import 'package:vocadb_app/src/features/entries/data/constants/fake_entry_list.dart';
import 'package:vocadb_app/src/features/entries/presentation/entries_search_screen/entries_search_result.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

class EntriesSearchScreen extends StatelessWidget {
  const EntriesSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        showTextInput: true,
        onChanged: (text) {},
        onCleared: () {},
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {
              GoRouter.of(context).pushNamed(AppRoute.entriesFilter.name);
            },
          ),
        ],
      ),
      body: EntriesSearchResult(
        entries: kFakeEntryList,
      ),
    );
  }
}
