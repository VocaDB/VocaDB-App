import 'package:vocadb_app/src/features/tags/domain/tag.dart';

class TagUsage {
  const TagUsage({required this.count, required this.tag});

  final int count;

  final Tag tag;
}
