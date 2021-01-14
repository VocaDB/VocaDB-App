import 'package:vocadb_app/models.dart';

class TagDetailArgs {
  /// An id of tag.
  final int id;

  /// Optional tag data for pre-display before fetch.
  final TagModel tag;

  const TagDetailArgs({this.id, this.tag});
}
