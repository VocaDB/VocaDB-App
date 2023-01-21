// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReleaseEvent _$$_ReleaseEventFromJson(Map<String, dynamic> json) =>
    _$_ReleaseEvent(
      id: json['id'] as int,
      name: json['name'] as String?,
      additionalNames: json['additionalNames'] as String?,
      description: json['description'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      category: json['category'] as String?,
      venueName: json['venueName'] as String?,
      mainPicture: json['mainPicture'] == null
          ? null
          : MainPicture.fromJson(json['mainPicture'] as Map<String, dynamic>),
      artists: (json['artists'] as List<dynamic>?)
              ?.map((e) => ArtistRole.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      series: json['series'] == null
          ? null
          : ReleaseEventSeries.fromJson(json['series'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => TagUsage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      webLinks: (json['webLinks'] as List<dynamic>?)
              ?.map((e) => WebLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ReleaseEventToJson(_$_ReleaseEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'additionalNames': instance.additionalNames,
      'description': instance.description,
      'date': instance.date?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'category': instance.category,
      'venueName': instance.venueName,
      'mainPicture': instance.mainPicture,
      'artists': instance.artists,
      'series': instance.series,
      'tags': instance.tags,
      'webLinks': instance.webLinks,
    };
