// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Entry _$$_EntryFromJson(Map<String, dynamic> json) => _$_Entry(
      id: json['id'] as int,
      entryType: json['entryType'] as String,
      additionalNames: json['additionalNames'] as String?,
      defaultName: json['defaultName'] as String?,
      name: json['name'] as String?,
      artistString: json['artistString'] as String?,
      artistType: json['artistType'] as String?,
      songType: json['songType'] as String?,
      discType: json['discType'] as String?,
      eventCategory: json['eventCategory'] as String?,
      activityDate: json['activityDate'] as String?,
      mainPicture: json['mainPicture'] == null
          ? null
          : MainPicture.fromJson(json['mainPicture'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => TagUsage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      webLinks: (json['webLinks'] as List<dynamic>?)
              ?.map((e) => WebLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_EntryToJson(_$_Entry instance) => <String, dynamic>{
      'id': instance.id,
      'entryType': instance.entryType,
      'additionalNames': instance.additionalNames,
      'defaultName': instance.defaultName,
      'name': instance.name,
      'artistString': instance.artistString,
      'artistType': instance.artistType,
      'songType': instance.songType,
      'discType': instance.discType,
      'eventCategory': instance.eventCategory,
      'activityDate': instance.activityDate,
      'mainPicture': instance.mainPicture,
      'tags': instance.tags,
      'webLinks': instance.webLinks,
    };
