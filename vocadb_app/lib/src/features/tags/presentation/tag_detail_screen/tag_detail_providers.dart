// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/tags/data/tag_repository.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';

final tagDetailProvider =
    FutureProvider.autoDispose.family<Tag, int>((ref, tagID) async {
  final tagRepository = ref.watch(tagRepositoryProvider);
  return tagRepository.fetchTagID(tagID);
});
