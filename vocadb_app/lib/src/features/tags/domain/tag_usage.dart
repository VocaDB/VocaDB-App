import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';

part 'tag_usage.freezed.dart';
part 'tag_usage.g.dart';

@freezed
class TagUsage with _$TagUsage {
  factory TagUsage({
    @Default(0) int count,
    required Tag tag,
  }) = _TagUsage;

  factory TagUsage.fromJson(Map<String, dynamic> json) =>
      _$TagUsageFromJson(json);
}
