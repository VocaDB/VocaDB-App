// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rated_songs_list_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RatedSongsListParams _$$_RatedSongsListParamsFromJson(
        Map<String, dynamic> json) =>
    _$_RatedSongsListParams(
      query: json['query'] as String?,
      tagId: (json['tagId'] as List<dynamic>?)?.map((e) => e as int).toList(),
      artistId:
          (json['artistId'] as List<dynamic>?)?.map((e) => e as int).toList(),
      rating: json['rating'] as String?,
      start: json['start'] as int? ?? 0,
      maxResults: json['maxResults'] as int? ?? 10,
      sort: json['sort'] as String? ?? 'RatingDate',
      fields: json['fields'] as String? ?? 'MainPicture,PVs',
      lang: json['lang'] as String? ?? 'Default',
    );

Map<String, dynamic> _$$_RatedSongsListParamsToJson(
        _$_RatedSongsListParams instance) =>
    <String, dynamic>{
      'query': instance.query,
      'tagId': instance.tagId,
      'artistId': instance.artistId,
      'rating': instance.rating,
      'start': instance.start,
      'maxResults': instance.maxResults,
      'sort': instance.sort,
      'fields': instance.fields,
      'lang': instance.lang,
    };
