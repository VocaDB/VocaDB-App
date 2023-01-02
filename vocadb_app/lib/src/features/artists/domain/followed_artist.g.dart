// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'followed_artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FollowedArtist _$$_FollowedArtistFromJson(Map<String, dynamic> json) =>
    _$_FollowedArtist(
      id: json['id'] as int,
      artist: Artist.fromJson(json['artist'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FollowedArtistToJson(_$_FollowedArtist instance) =>
    <String, dynamic>{
      'id': instance.id,
      'artist': instance.artist,
    };
