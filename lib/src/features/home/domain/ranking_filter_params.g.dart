// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_filter_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RankingFilterParams _$$_RankingFilterParamsFromJson(
        Map<String, dynamic> json) =>
    _$_RankingFilterParams(
      filterBy: json['filterBy'] as String? ?? 'CreateDate',
      vocalist: json['vocalist'] as String? ?? 'Nothing',
    );

Map<String, dynamic> _$$_RankingFilterParamsToJson(
        _$_RankingFilterParams instance) =>
    <String, dynamic>{
      'filterBy': instance.filterBy,
      'vocalist': instance.vocalist,
    };
