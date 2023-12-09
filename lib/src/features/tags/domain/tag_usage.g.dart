// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_usage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TagUsage _$$_TagUsageFromJson(Map<String, dynamic> json) => _$_TagUsage(
      count: json['count'] as int? ?? 0,
      tag: Tag.fromJson(json['tag'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TagUsageToJson(_$_TagUsage instance) =>
    <String, dynamic>{
      'count': instance.count,
      'tag': instance.tag,
    };
