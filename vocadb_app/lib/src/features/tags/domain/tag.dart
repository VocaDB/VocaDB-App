// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';

class Tag {
  final int id;

  final String? name;

  final String? categoryName;

  final String? description;

  final MainPicture? mainPicture;

  final Tag? parent;

  final List<Tag>? relatedTags;

  final int? usageCount;

  final List<WebLink>? webLinks;

  final String? additionalNames;

  Tag({
    required this.id,
    this.name,
    this.categoryName,
    this.description,
    this.mainPicture,
    this.parent,
    this.relatedTags,
    this.usageCount,
    this.webLinks,
    this.additionalNames,
  });
}
