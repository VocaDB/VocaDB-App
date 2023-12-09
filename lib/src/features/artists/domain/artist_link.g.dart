// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArtistLink _$$_ArtistLinkFromJson(Map<String, dynamic> json) =>
    _$_ArtistLink(
      linkType: json['linkType'] as String,
      artist: Artist.fromJson(json['artist'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ArtistLinkToJson(_$_ArtistLink instance) =>
    <String, dynamic>{
      'linkType': instance.linkType,
      'artist': instance.artist,
    };
