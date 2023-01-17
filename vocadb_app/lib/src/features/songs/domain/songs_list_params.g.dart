// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songs_list_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SongsListParams _$$_SongsListParamsFromJson(Map<String, dynamic> json) =>
    _$_SongsListParams(
      query: json['query'] as String?,
      songTypes: json['songTypes'] as String?,
      sort: json['sort'] as String? ?? 'None',
      artistId:
          (json['artistId'] as List<dynamic>?)?.map((e) => e as int).toList(),
      tagId: (json['tagId[]'] as List<dynamic>?)?.map((e) => e as int).toList(),
      start: json['start'] as int? ?? 0,
      maxResults: json['maxResults'] as int? ?? 10,
      fields: json['fields'] as String? ?? 'ThumbUrl,PVs,MainPicture',
      lang: json['lang'] as String? ?? 'Default',
      nameMatchMode: json['nameMatchMode'] as String? ?? 'Auto',
    );

Map<String, dynamic> _$$_SongsListParamsToJson(_$_SongsListParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('query', instance.query);
  writeNotNull('songTypes', instance.songTypes);
  val['sort'] = instance.sort;
  writeNotNull('artistId', instance.artistId);
  writeNotNull('tagId[]', instance.tagId);
  val['start'] = instance.start;
  val['maxResults'] = instance.maxResults;
  val['fields'] = instance.fields;
  val['lang'] = instance.lang;
  val['nameMatchMode'] = instance.nameMatchMode;
  return val;
}
