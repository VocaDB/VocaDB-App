// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Track _$$_TrackFromJson(Map<String, dynamic> json) => _$_Track(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      discNumber: json['discNumber'] as int? ?? 0,
      trackNumber: json['trackNumber'] as int? ?? 0,
      song: json['song'] == null
          ? null
          : Song.fromJson(json['song'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TrackToJson(_$_Track instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'discNumber': instance.discNumber,
      'trackNumber': instance.trackNumber,
      'song': instance.song,
    };
