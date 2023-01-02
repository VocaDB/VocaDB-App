// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Song _$$_SongFromJson(Map<String, dynamic> json) => _$_Song(
      id: json['id'] as int,
      name: json['name'] as String?,
      artistString: json['artistString'] as String?,
      imageUrl: json['imageUrl'] as String?,
      songType: json['songType'] as String?,
      pvServices: json['pvServices'] as String?,
      additionalNames: json['additionalNames'] as String?,
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
      mainPicture: json['mainPicture'] == null
          ? null
          : MainPicture.fromJson(json['mainPicture'] as Map<String, dynamic>),
      favoritedTimes: json['favoritedTimes'] as int? ?? 0,
      lengthSeconds: json['lengthSeconds'] as int? ?? 0,
      publishDate: json['publishDate'] == null
          ? null
          : DateTime.parse(json['publishDate'] as String),
      ratingScore: json['ratingScore'] as int? ?? 0,
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => TagUsage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      artists: (json['artists'] as List<dynamic>?)
              ?.map((e) => ArtistRole.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      albums: (json['albums'] as List<dynamic>?)
              ?.map((e) => Album.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      lyrics: (json['lyrics'] as List<dynamic>?)
              ?.map((e) => Lyric.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      pvs: (json['pvs'] as List<dynamic>?)
              ?.map((e) => PV.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      webLinks: (json['webLinks'] as List<dynamic>?)
              ?.map((e) => WebLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_SongToJson(_$_Song instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'artistString': instance.artistString,
      'imageUrl': instance.imageUrl,
      'songType': instance.songType,
      'pvServices': instance.pvServices,
      'additionalNames': instance.additionalNames,
      'createDate': instance.createDate?.toIso8601String(),
      'mainPicture': instance.mainPicture,
      'favoritedTimes': instance.favoritedTimes,
      'lengthSeconds': instance.lengthSeconds,
      'publishDate': instance.publishDate?.toIso8601String(),
      'ratingScore': instance.ratingScore,
      'tags': instance.tags,
      'artists': instance.artists,
      'albums': instance.albums,
      'lyrics': instance.lyrics,
      'pvs': instance.pvs,
      'webLinks': instance.webLinks,
    };
