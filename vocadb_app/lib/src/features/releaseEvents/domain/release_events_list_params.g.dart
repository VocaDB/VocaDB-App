// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release_events_list_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReleaseEventsListParams _$$_ReleaseEventsListParamsFromJson(
        Map<String, dynamic> json) =>
    _$_ReleaseEventsListParams(
      query: json['query'] as String?,
      sort: json['sort'] as String? ?? 'Date',
      tagId: (json['tagId[]'] as List<dynamic>?)?.map((e) => e as int).toList(),
      artistId:
          (json['artistId[]'] as List<dynamic>?)?.map((e) => e as int).toList(),
      afterDate: json['afterDate'] == null
          ? null
          : DateTime.parse(json['afterDate'] as String),
      beforeDate: json['beforeDate'] == null
          ? null
          : DateTime.parse(json['beforeDate'] as String),
      start: json['start'] ?? 0,
      maxResult: json['maxResult'] ?? 10,
      lang: json['lang'] ?? 'Default',
    );

Map<String, dynamic> _$$_ReleaseEventsListParamsToJson(
    _$_ReleaseEventsListParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('query', instance.query);
  writeNotNull('sort', instance.sort);
  writeNotNull('tagId[]', instance.tagId);
  writeNotNull('artistId[]', instance.artistId);
  writeNotNull('afterDate', instance.afterDate?.toIso8601String());
  writeNotNull('beforeDate', instance.beforeDate?.toIso8601String());
  writeNotNull('start', instance.start);
  writeNotNull('maxResult', instance.maxResult);
  writeNotNull('lang', instance.lang);
  return val;
}
