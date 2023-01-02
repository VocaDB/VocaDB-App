// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Track _$$_TrackFromJson(Map<String, dynamic> json) => _$_Track(
      id: json['id'] as int,
      discNumber: json['discNumber'] as int,
      song: Song.fromJson(json['song'] as Map<String, dynamic>),
      trackNumber: json['trackNumber'] as int,
    );

Map<String, dynamic> _$$_TrackToJson(_$_Track instance) => <String, dynamic>{
      'id': instance.id,
      'discNumber': instance.discNumber,
      'song': instance.song,
      'trackNumber': instance.trackNumber,
    };
