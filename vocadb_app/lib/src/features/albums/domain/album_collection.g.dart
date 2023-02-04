// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AlbumCollection _$$_AlbumCollectionFromJson(Map<String, dynamic> json) =>
    _$_AlbumCollection(
      mediaType: json['mediaType'] as String,
      purchaseStatus: json['purchaseStatus'] as String,
      rating: json['rating'] as int,
      album: Album.fromJson(json['album'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AlbumCollectionToJson(_$_AlbumCollection instance) =>
    <String, dynamic>{
      'mediaType': instance.mediaType,
      'purchaseStatus': instance.purchaseStatus,
      'rating': instance.rating,
      'album': instance.album,
    };
