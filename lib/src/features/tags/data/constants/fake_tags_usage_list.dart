import 'package:vocadb_app/src/features/tags/domain/tag.dart';
import 'package:vocadb_app/src/features/tags/domain/tag_usage.dart';

final kFakeTagsUsageList = [
  TagUsage(
    count: 4,
    tag: Tag(
      id: 16,
      name: 'alternative rock',
      categoryName: 'Genres',
    ),
  ),
  TagUsage(
    count: 6,
    tag: Tag(
      id: 260,
      name: 'melancholic',
      categoryName: 'Subjective',
    ),
  ),
  TagUsage(
    count: 5,
    tag: Tag(
      id: 337,
      name: 'piano',
      categoryName: 'Instruments',
    ),
  ),
];
