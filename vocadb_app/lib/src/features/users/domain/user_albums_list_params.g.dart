// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_albums_list_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserAlbumsListParams _$$_UserAlbumsListParamsFromJson(
        Map<String, dynamic> json) =>
    _$_UserAlbumsListParams(
      query: json['query'] as String?,
      tagId: (json['tagId[]'] as List<dynamic>?)?.map((e) => e as int).toList(),
      artistId:
          (json['artistId[]'] as List<dynamic>?)?.map((e) => e as int).toList(),
      start: json['start'] as int? ?? 0,
      maxResults: json['maxResults'] as int? ?? 10,
      purchaseStatuses: json['purchaseStatuses'] as String?,
      albumTypes: json['albumTypes'] as String? ?? 'Unknown',
      sort: json['sort'] as String? ?? 'Name',
      fields: json['fields'] as String? ?? 'MainPicture',
      lang: json['lang'] as String? ?? 'Default',
      nameMatchMode: json['nameMatchMode'] as String? ?? 'Auto',
      mediaType: json['mediaType'] as String?,
    );

Map<String, dynamic> _$$_UserAlbumsListParamsToJson(
    _$_UserAlbumsListParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('query', instance.query);
  writeNotNull('tagId[]', instance.tagId);
  writeNotNull('artistId[]', instance.artistId);
  val['start'] = instance.start;
  val['maxResults'] = instance.maxResults;
  writeNotNull('purchaseStatuses', instance.purchaseStatuses);
  val['albumTypes'] = instance.albumTypes;
  val['sort'] = instance.sort;
  val['fields'] = instance.fields;
  val['lang'] = instance.lang;
  val['nameMatchMode'] = instance.nameMatchMode;
  writeNotNull('mediaType', instance.mediaType);
  return val;
}
