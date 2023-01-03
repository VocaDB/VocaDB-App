// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArtistRole _$$_ArtistRoleFromJson(Map<String, dynamic> json) =>
    _$_ArtistRole(
      id: json['id'] as int?,
      name: json['name'] as String?,
      categories: json['categories'] as String?,
      effectiveRoles: json['effectiveRoles'] as String? ?? 'Default',
      roles: json['roles'] as String? ?? 'Default',
      artist: json['artist'] == null
          ? null
          : Artist.fromJson(json['artist'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ArtistRoleToJson(_$_ArtistRole instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'categories': instance.categories,
      'effectiveRoles': instance.effectiveRoles,
      'roles': instance.roles,
      'artist': instance.artist,
    };
