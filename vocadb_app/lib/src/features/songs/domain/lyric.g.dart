// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyric.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Lyric _$$_LyricFromJson(Map<String, dynamic> json) => _$_Lyric(
      id: json['id'] as int,
      cultureCode: json['cultureCode'] as String?,
      source: json['source'] as String?,
      translationType: json['translationType'] as String?,
      url: json['url'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$$_LyricToJson(_$_Lyric instance) => <String, dynamic>{
      'id': instance.id,
      'cultureCode': instance.cultureCode,
      'source': instance.source,
      'translationType': instance.translationType,
      'url': instance.url,
      'value': instance.value,
    };
