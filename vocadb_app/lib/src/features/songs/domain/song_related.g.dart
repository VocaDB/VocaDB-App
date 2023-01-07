// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_related.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SongRelated _$$_SongRelatedFromJson(Map<String, dynamic> json) =>
    _$_SongRelated(
      artistMatches: (json['artistMatches'] as List<dynamic>?)
              ?.map((e) => Song.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      likeMatches: (json['likeMatches'] as List<dynamic>?)
              ?.map((e) => Song.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tagMatches: (json['tagMatches'] as List<dynamic>?)
              ?.map((e) => Song.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_SongRelatedToJson(_$_SongRelated instance) =>
    <String, dynamic>{
      'artistMatches': instance.artistMatches,
      'likeMatches': instance.likeMatches,
      'tagMatches': instance.tagMatches,
    };
