import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/common_widgets/custom_network_image.dart';
import 'package:vocadb_app/src/features/entries/domain/entry.dart';
import 'package:vocadb_app/src/routing/app_route_context.dart';

class EntriesSearchResult extends StatelessWidget {
  const EntriesSearchResult({super.key, required this.entries});

  final List<Entry> entries;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: ((context, index) {
        final entry = entries[index];
        return ListTile(
          leading: CustomNetworkImage(
            entry.imageUrl,
            width: 64,
            height: 64,
          ),
          title: Text(entry.name ?? '<None>'),
          subtitle: Text(entry.entryType),
          onTap: () {
            context.goEntryDetail(entry);
          },
        );
      }),
    );
  }
}
