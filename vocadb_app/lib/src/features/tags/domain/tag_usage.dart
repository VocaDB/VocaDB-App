// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:vocadb_app/src/features/tags/domain/tag.dart';

class TagUsage {
  const TagUsage({
    required this.count,
    required this.tag,
  });

  final int count;

  final Tag tag;

  TagUsage copyWith({
    int? count,
    Tag? tag,
  }) {
    return TagUsage(
      count: count ?? this.count,
      tag: tag ?? this.tag,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
      'tag': tag.toMap(),
    };
  }

  factory TagUsage.fromMap(Map<String, dynamic> map) {
    return TagUsage(
      count: map['count'] as int,
      tag: Tag.fromMap(map['tag'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory TagUsage.fromJson(String source) =>
      TagUsage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TagUsage(count: $count, tag: $tag)';

  @override
  bool operator ==(covariant TagUsage other) {
    if (identical(this, other)) return true;

    return other.count == count && other.tag == tag;
  }

  @override
  int get hashCode => count.hashCode ^ tag.hashCode;
}
