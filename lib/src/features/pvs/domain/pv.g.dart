// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pv.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PV _$$_PVFromJson(Map<String, dynamic> json) => _$_PV(
      id: json['id'] as int,
      name: json['name'] as String,
      service: json['service'] as String,
      pvType: json['pvType'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$_PVToJson(_$_PV instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'service': instance.service,
      'pvType': instance.pvType,
      'url': instance.url,
    };
