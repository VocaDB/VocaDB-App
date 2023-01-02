// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Album _$$_AlbumFromJson(Map<String, dynamic> json) => _$_Album(
      id: json['id'] as int,
      name: json['name'] as String?,
      artistString: json['artistString'] as String?,
      discType: json['discType'] as String?,
      catalogNumber: json['catalogNumber'] as String?,
      description: json['description'] as String?,
      discs: (json['discs'] as List<dynamic>?)
              ?.map((e) => Disc.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      mainPicture: json['mainPicture'] == null
          ? null
          : MainPicture.fromJson(json['mainPicture'] as Map<String, dynamic>),
      artists: (json['artists'] as List<dynamic>?)
              ?.map((e) => ArtistRole.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      pvs: (json['pvs'] as List<dynamic>?)
              ?.map((e) => PV.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      ratingAverage: (json['ratingAverage'] as num?)?.toDouble() ?? 0.00,
      ratingCount: json['ratingCount'] as int? ?? 0,
      releaseDate: json['releaseDate'] == null
          ? null
          : ReleaseDate.fromJson(json['releaseDate'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => TagUsage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tracks: (json['tracks'] as List<dynamic>?)
              ?.map((e) => Track.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      webLinks: (json['webLinks'] as List<dynamic>?)
              ?.map((e) => WebLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_AlbumToJson(_$_Album instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'artistString': instance.artistString,
      'discType': instance.discType,
      'catalogNumber': instance.catalogNumber,
      'description': instance.description,
      'discs': instance.discs,
      'mainPicture': instance.mainPicture,
      'artists': instance.artists,
      'pvs': instance.pvs,
      'ratingAverage': instance.ratingAverage,
      'ratingCount': instance.ratingCount,
      'releaseDate': instance.releaseDate,
      'tags': instance.tags,
      'tracks': instance.tracks,
      'webLinks': instance.webLinks,
    };
