// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_relations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArtistRelations _$$_ArtistRelationsFromJson(Map<String, dynamic> json) =>
    _$_ArtistRelations(
      latestSongs: (json['latestSongs'] as List<dynamic>?)
              ?.map((e) => Song.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      popularSongs: (json['popularSongs'] as List<dynamic>?)
              ?.map((e) => Song.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      latestAlbums: (json['latestAlbums'] as List<dynamic>?)
              ?.map((e) => Album.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      popularAlbums: (json['popularAlbums'] as List<dynamic>?)
              ?.map((e) => Album.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ArtistRelationsToJson(_$_ArtistRelations instance) =>
    <String, dynamic>{
      'latestSongs': instance.latestSongs,
      'popularSongs': instance.popularSongs,
      'latestAlbums': instance.latestAlbums,
      'popularAlbums': instance.popularAlbums,
    };
