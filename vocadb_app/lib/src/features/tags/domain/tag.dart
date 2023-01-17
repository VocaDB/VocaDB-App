import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';

part 'tag.freezed.dart';
part 'tag.g.dart';

@freezed
class Tag with _$Tag {
  factory Tag({
    required int id,
    String? name,
    String? categoryName,
    String? description,
    MainPicture? mainPicture,
    Tag? parent,
    @Default([]) List<Tag> relatedTags,
    @Default(0) int usageCount,
    @Default([]) List<WebLink> webLinks,
    String? additionalNames,
  }) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}

extension TagExtended on Tag {
  String? get imageUrl => mainPicture?.urlOriginal;
}
