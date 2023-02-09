// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$$_AppUserFromJson(Map<String, dynamic> json) => _$_AppUser(
      id: json['id'] as int,
      name: json['name'] as String,
      mainPicture: json['mainPicture'] == null
          ? null
          : MainPicture.fromJson(json['mainPicture'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AppUserToJson(_$_AppUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mainPicture': instance.mainPicture,
    };
