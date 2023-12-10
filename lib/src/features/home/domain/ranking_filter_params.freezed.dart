// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ranking_filter_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RankingFilterParams _$RankingFilterParamsFromJson(Map<String, dynamic> json) {
  return _RankingFilterParams.fromJson(json);
}

/// @nodoc
mixin _$RankingFilterParams {
  String get filterBy => throw _privateConstructorUsedError;
  String get vocalist => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RankingFilterParamsCopyWith<RankingFilterParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RankingFilterParamsCopyWith<$Res> {
  factory $RankingFilterParamsCopyWith(
          RankingFilterParams value, $Res Function(RankingFilterParams) then) =
      _$RankingFilterParamsCopyWithImpl<$Res, RankingFilterParams>;
  @useResult
  $Res call({String filterBy, String vocalist});
}

/// @nodoc
class _$RankingFilterParamsCopyWithImpl<$Res, $Val extends RankingFilterParams>
    implements $RankingFilterParamsCopyWith<$Res> {
  _$RankingFilterParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterBy = null,
    Object? vocalist = null,
  }) {
    return _then(_value.copyWith(
      filterBy: null == filterBy
          ? _value.filterBy
          : filterBy // ignore: cast_nullable_to_non_nullable
              as String,
      vocalist: null == vocalist
          ? _value.vocalist
          : vocalist // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RankingFilterParamsCopyWith<$Res>
    implements $RankingFilterParamsCopyWith<$Res> {
  factory _$$_RankingFilterParamsCopyWith(_$_RankingFilterParams value,
          $Res Function(_$_RankingFilterParams) then) =
      __$$_RankingFilterParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String filterBy, String vocalist});
}

/// @nodoc
class __$$_RankingFilterParamsCopyWithImpl<$Res>
    extends _$RankingFilterParamsCopyWithImpl<$Res, _$_RankingFilterParams>
    implements _$$_RankingFilterParamsCopyWith<$Res> {
  __$$_RankingFilterParamsCopyWithImpl(_$_RankingFilterParams _value,
      $Res Function(_$_RankingFilterParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterBy = null,
    Object? vocalist = null,
  }) {
    return _then(_$_RankingFilterParams(
      filterBy: null == filterBy
          ? _value.filterBy
          : filterBy // ignore: cast_nullable_to_non_nullable
              as String,
      vocalist: null == vocalist
          ? _value.vocalist
          : vocalist // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_RankingFilterParams implements _RankingFilterParams {
  const _$_RankingFilterParams(
      {this.filterBy = 'CreateDate', this.vocalist = 'Nothing'});

  factory _$_RankingFilterParams.fromJson(Map<String, dynamic> json) =>
      _$$_RankingFilterParamsFromJson(json);

  @override
  @JsonKey()
  final String filterBy;
  @override
  @JsonKey()
  final String vocalist;

  @override
  String toString() {
    return 'RankingFilterParams(filterBy: $filterBy, vocalist: $vocalist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RankingFilterParams &&
            (identical(other.filterBy, filterBy) ||
                other.filterBy == filterBy) &&
            (identical(other.vocalist, vocalist) ||
                other.vocalist == vocalist));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, filterBy, vocalist);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RankingFilterParamsCopyWith<_$_RankingFilterParams> get copyWith =>
      __$$_RankingFilterParamsCopyWithImpl<_$_RankingFilterParams>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RankingFilterParamsToJson(
      this,
    );
  }
}

abstract class _RankingFilterParams implements RankingFilterParams {
  const factory _RankingFilterParams(
      {final String filterBy, final String vocalist}) = _$_RankingFilterParams;

  factory _RankingFilterParams.fromJson(Map<String, dynamic> json) =
      _$_RankingFilterParams.fromJson;

  @override
  String get filterBy;
  @override
  String get vocalist;
  @override
  @JsonKey(ignore: true)
  _$$_RankingFilterParamsCopyWith<_$_RankingFilterParams> get copyWith =>
      throw _privateConstructorUsedError;
}
