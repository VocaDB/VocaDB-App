// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tag _$$_TagFromJson(Map<String, dynamic> json) => _$_Tag(
      id: json['id'] as int,
      name: json['name'] as String?,
      categoryName: json['categoryName'] as String?,
      description: json['description'] as String?,
      mainPicture: json['mainPicture'] == null
          ? null
          : MainPicture.fromJson(json['mainPicture'] as Map<String, dynamic>),
      parent: json['parent'] == null
          ? null
          : Tag.fromJson(json['parent'] as Map<String, dynamic>),
      relatedTags: (json['relatedTags'] as List<dynamic>?)
              ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      usageCount: json['usageCount'] as int? ?? 0,
      webLinks: (json['webLinks'] as List<dynamic>?)
              ?.map((e) => WebLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      additionalNames: json['additionalNames'] as String?,
    );

Map<String, dynamic> _$$_TagToJson(_$_Tag instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'categoryName': instance.categoryName,
      'description': instance.description,
      'mainPicture': instance.mainPicture,
      'parent': instance.parent,
      'relatedTags': instance.relatedTags,
      'usageCount': instance.usageCount,
      'webLinks': instance.webLinks,
      'additionalNames': instance.additionalNames,
    };
