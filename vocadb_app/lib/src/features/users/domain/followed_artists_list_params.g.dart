// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'followed_artists_list_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FollowedArtistsListParams _$$_FollowedArtistsListParamsFromJson(
        Map<String, dynamic> json) =>
    _$_FollowedArtistsListParams(
      query: json['query'] as String?,
      tagId: (json['tagId[]'] as List<dynamic>?)?.map((e) => e as int).toList(),
      start: json['start'] as int? ?? 0,
      maxResults: json['maxResults'] as int? ?? 10,
      artistType: json['artistType'] as String? ?? 'Unknown',
      sort: json['sort'] as String? ?? 'Name',
      fields: json['fields'] as String? ?? 'MainPicture',
      lang: json['lang'] as String? ?? 'Default',
    );

Map<String, dynamic> _$$_FollowedArtistsListParamsToJson(
    _$_FollowedArtistsListParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('query', instance.query);
  writeNotNull('tagId[]', instance.tagId);
  val['start'] = instance.start;
  val['maxResults'] = instance.maxResults;
  val['artistType'] = instance.artistType;
  val['sort'] = instance.sort;
  val['fields'] = instance.fields;
  val['lang'] = instance.lang;
  return val;
}
