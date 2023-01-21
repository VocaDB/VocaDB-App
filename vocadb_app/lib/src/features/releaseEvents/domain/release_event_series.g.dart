// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release_event_series.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReleaseEventSeries _$$_ReleaseEventSeriesFromJson(
        Map<String, dynamic> json) =>
    _$_ReleaseEventSeries(
      id: json['id'] as int,
      name: json['name'] as String?,
      additionalNames: json['additionalNames'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      events: (json['events'] as List<dynamic>?)
              ?.map((e) => ReleaseEvent.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      mainPicture: json['mainPicture'] == null
          ? null
          : MainPicture.fromJson(json['mainPicture'] as Map<String, dynamic>),
      webLinks: (json['webLinks'] as List<dynamic>?)
              ?.map((e) => WebLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ReleaseEventSeriesToJson(
        _$_ReleaseEventSeries instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'additionalNames': instance.additionalNames,
      'description': instance.description,
      'category': instance.category,
      'events': instance.events,
      'mainPicture': instance.mainPicture,
      'webLinks': instance.webLinks,
    };
