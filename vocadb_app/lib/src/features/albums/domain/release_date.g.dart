// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReleaseDate _$$_ReleaseDateFromJson(Map<String, dynamic> json) =>
    _$_ReleaseDate(
      day: json['day'] as int? ?? 0,
      formatted: json['formatted'] as String? ?? '',
      month: json['month'] as int? ?? 0,
      year: json['year'] as int? ?? 0,
    );

Map<String, dynamic> _$$_ReleaseDateToJson(_$_ReleaseDate instance) =>
    <String, dynamic>{
      'day': instance.day,
      'formatted': instance.formatted,
      'month': instance.month,
      'year': instance.year,
    };
