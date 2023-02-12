// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AlbumRate _$$_AlbumRateFromJson(Map<String, dynamic> json) => _$_AlbumRate(
      collectionStatus: json['collectionStatus'] as String? ?? 'Nothing',
      mediaType: json['mediaType'] as String,
      rating: json['rating'] as int,
    );

Map<String, dynamic> _$$_AlbumRateToJson(_$_AlbumRate instance) =>
    <String, dynamic>{
      'collectionStatus': instance.collectionStatus,
      'mediaType': instance.mediaType,
      'rating': instance.rating,
    };
