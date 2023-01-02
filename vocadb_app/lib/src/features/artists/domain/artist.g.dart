// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Artist _$$_ArtistFromJson(Map<String, dynamic> json) => _$_Artist(
      id: json['id'] as int,
      name: json['name'] as String?,
      additionalNames: json['additionalNames'] as String?,
      releaseDate: json['releaseDate'] as String?,
      artistType: json['artistType'] as String?,
      description: json['description'] as String?,
      mainPicture: json['mainPicture'] == null
          ? null
          : MainPicture.fromJson(json['mainPicture'] as Map<String, dynamic>),
      relations: json['relations'] == null
          ? null
          : ArtistRelations.fromJson(json['relations'] as Map<String, dynamic>),
      baseVoicebank: json['baseVoicebank'] == null
          ? null
          : Artist.fromJson(json['baseVoicebank'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => TagUsage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      webLinks: (json['webLinks'] as List<dynamic>?)
              ?.map((e) => WebLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      artistLinksReverse: (json['artistLinksReverse'] as List<dynamic>?)
              ?.map((e) => ArtistLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      artistLinks: (json['artistLinks'] as List<dynamic>?)
              ?.map((e) => ArtistLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ArtistToJson(_$_Artist instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'additionalNames': instance.additionalNames,
      'releaseDate': instance.releaseDate,
      'artistType': instance.artistType,
      'description': instance.description,
      'mainPicture': instance.mainPicture,
      'relations': instance.relations,
      'baseVoicebank': instance.baseVoicebank,
      'tags': instance.tags,
      'webLinks': instance.webLinks,
      'artistLinksReverse': instance.artistLinksReverse,
      'artistLinks': instance.artistLinks,
    };
