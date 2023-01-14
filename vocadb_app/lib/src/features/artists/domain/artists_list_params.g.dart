// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artists_list_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArtistsListParams _$$_ArtistsListParamsFromJson(Map<String, dynamic> json) =>
    _$_ArtistsListParams(
      query: json['query'] as String?,
      artistTypes: json['artistTypes'] as String?,
      tagId: (json['tagId'] as List<dynamic>?)?.map((e) => e as int).toList(),
      start: json['start'] as int? ?? 0,
      maxResults: json['maxResults'] as int? ?? 10,
      sort: json['sort'] as String? ?? 'None',
      nameMatchMode: json['nameMatchMode'] as String? ?? 'Auto',
      fields: json['fields'] as String? ?? 'MainPicture',
      lang: json['lang'] as String? ?? 'Default',
    );

Map<String, dynamic> _$$_ArtistsListParamsToJson(
    _$_ArtistsListParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('query', instance.query);
  writeNotNull('artistTypes', instance.artistTypes);
  writeNotNull('tagId', instance.tagId);
  val['start'] = instance.start;
  val['maxResults'] = instance.maxResults;
  val['sort'] = instance.sort;
  val['nameMatchMode'] = instance.nameMatchMode;
  val['fields'] = instance.fields;
  val['lang'] = instance.lang;
  return val;
}
