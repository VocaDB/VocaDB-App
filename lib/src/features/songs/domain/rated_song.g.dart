// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rated_song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RatedSong _$$_RatedSongFromJson(Map<String, dynamic> json) => _$_RatedSong(
      rating: json['rating'] as String,
      song: Song.fromJson(json['song'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RatedSongToJson(_$_RatedSong instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'song': instance.song,
    };
