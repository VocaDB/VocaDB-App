// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'album_rate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AlbumRate _$AlbumRateFromJson(Map<String, dynamic> json) {
  return _AlbumRate.fromJson(json);
}

/// @nodoc
mixin _$AlbumRate {
  String get collectionStatus => throw _privateConstructorUsedError;
  String get mediaType => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumRateCopyWith<AlbumRate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumRateCopyWith<$Res> {
  factory $AlbumRateCopyWith(AlbumRate value, $Res Function(AlbumRate) then) =
      _$AlbumRateCopyWithImpl<$Res, AlbumRate>;
  @useResult
  $Res call({String collectionStatus, String mediaType, int rating});
}

/// @nodoc
class _$AlbumRateCopyWithImpl<$Res, $Val extends AlbumRate>
    implements $AlbumRateCopyWith<$Res> {
  _$AlbumRateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionStatus = null,
    Object? mediaType = null,
    Object? rating = null,
  }) {
    return _then(_value.copyWith(
      collectionStatus: null == collectionStatus
          ? _value.collectionStatus
          : collectionStatus // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AlbumRateCopyWith<$Res> implements $AlbumRateCopyWith<$Res> {
  factory _$$_AlbumRateCopyWith(
          _$_AlbumRate value, $Res Function(_$_AlbumRate) then) =
      __$$_AlbumRateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String collectionStatus, String mediaType, int rating});
}

/// @nodoc
class __$$_AlbumRateCopyWithImpl<$Res>
    extends _$AlbumRateCopyWithImpl<$Res, _$_AlbumRate>
    implements _$$_AlbumRateCopyWith<$Res> {
  __$$_AlbumRateCopyWithImpl(
      _$_AlbumRate _value, $Res Function(_$_AlbumRate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionStatus = null,
    Object? mediaType = null,
    Object? rating = null,
  }) {
    return _then(_$_AlbumRate(
      collectionStatus: null == collectionStatus
          ? _value.collectionStatus
          : collectionStatus // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AlbumRate implements _AlbumRate {
  const _$_AlbumRate(
      {this.collectionStatus = 'Nothing',
      required this.mediaType,
      required this.rating});

  factory _$_AlbumRate.fromJson(Map<String, dynamic> json) =>
      _$$_AlbumRateFromJson(json);

  @override
  @JsonKey()
  final String collectionStatus;
  @override
  final String mediaType;
  @override
  final int rating;

  @override
  String toString() {
    return 'AlbumRate(collectionStatus: $collectionStatus, mediaType: $mediaType, rating: $rating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AlbumRate &&
            (identical(other.collectionStatus, collectionStatus) ||
                other.collectionStatus == collectionStatus) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, collectionStatus, mediaType, rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AlbumRateCopyWith<_$_AlbumRate> get copyWith =>
      __$$_AlbumRateCopyWithImpl<_$_AlbumRate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AlbumRateToJson(
      this,
    );
  }
}

abstract class _AlbumRate implements AlbumRate {
  const factory _AlbumRate(
      {final String collectionStatus,
      required final String mediaType,
      required final int rating}) = _$_AlbumRate;

  factory _AlbumRate.fromJson(Map<String, dynamic> json) =
      _$_AlbumRate.fromJson;

  @override
  String get collectionStatus;
  @override
  String get mediaType;
  @override
  int get rating;
  @override
  @JsonKey(ignore: true)
  _$$_AlbumRateCopyWith<_$_AlbumRate> get copyWith =>
      throw _privateConstructorUsedError;
}
