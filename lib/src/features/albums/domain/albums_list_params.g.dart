// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albums_list_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AlbumsListParams _$$_AlbumsListParamsFromJson(Map<String, dynamic> json) =>
    _$_AlbumsListParams(
      query: json['query'] as String?,
      discTypes: json['discTypes'] as String?,
      tagId: (json['tagId[]'] as List<dynamic>?)?.map((e) => e as int).toList(),
      start: json['start'] as int? ?? 0,
      maxResults: json['maxResults'] as int? ?? 10,
      sort: json['sort'] as String? ?? 'None',
      nameMatchMode: json['nameMatchMode'] as String? ?? 'Auto',
      fields: json['fields'] as String? ?? 'MainPicture',
      lang: json['lang'] as String? ?? 'Default',
    );

Map<String, dynamic> _$$_AlbumsListParamsToJson(_$_AlbumsListParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('query', instance.query);
  writeNotNull('discTypes', instance.discTypes);
  writeNotNull('tagId[]', instance.tagId);
  val['start'] = instance.start;
  val['maxResults'] = instance.maxResults;
  val['sort'] = instance.sort;
  val['nameMatchMode'] = instance.nameMatchMode;
  val['fields'] = instance.fields;
  val['lang'] = instance.lang;
  return val;
}
