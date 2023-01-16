import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/tags/data/constants/fake_tag_detail.dart';
import 'package:vocadb_app/src/features/tags/data/tag_repository.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';

class TagFakeRepository implements TagRepository {
  @override
  Future<Tag> fetchTagID(int id, {String lang = 'Default'}) {
    return Future.value(kFakeTagDetail);
  }
}

final tagFakeRepositoryProvider = Provider<TagFakeRepository>((ref) {
  return TagFakeRepository();
});
