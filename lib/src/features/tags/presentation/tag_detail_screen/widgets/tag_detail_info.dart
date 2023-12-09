import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/markdown.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';

class TagDetailInfo extends StatelessWidget {
  const TagDetailInfo({super.key, required this.tag});

  final Tag tag;

  static const nameKey = Key('name-key');
  static const categoryKey = Key('category-key');
  static const descriptionKey = Key('description-key');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          key: nameKey,
          title: const Text('Name'),
          subtitle: Text(tag.name ?? '<None>'),
        ),
        ListTile(
          key: categoryKey,
          title: const Text('Category'),
          subtitle: Text(tag.categoryName ?? '<None>'),
        ),
        gapH8,
        ListTile(
          key: descriptionKey,
          title: const Text('Description'),
          subtitle: Markdown(
            data: tag.description ?? '<None>',
          ),
        ),
      ],
    );
  }
}
