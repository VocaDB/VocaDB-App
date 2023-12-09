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
      rating: json['rating'] as String? ?? 'Nothing',
      start: json['start'] as int? ?? 0,
      maxResults: json['maxResults'] as int? ?? 10,
      sort: json['sort'] as String? ?? 'RatingDate',
      fields: json['fields'] as String? ?? 'MainPicture,PVs',
      lang: json['lang'] as String? ?? 'Default',
    );

Map<String, dynamic> _$$_RatedSongsListParamsToJson(
    _$_RatedSongsListParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('query', instance.query);
  writeNotNull('tagId', instance.tagId);
  writeNotNull('artistId', instance.artistId);
  val['rating'] = instance.rating;
  val['start'] = instance.start;
  val['maxResults'] = instance.maxResults;
  val['sort'] = instance.sort;
  val['fields'] = instance.fields;
  val['lang'] = instance.lang;
  return val;
}
