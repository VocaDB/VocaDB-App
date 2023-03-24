// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'album_collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AlbumCollection _$AlbumCollectionFromJson(Map<String, dynamic> json) {
  return _AlbumCollection.fromJson(json);
}

/// @nodoc
mixin _$AlbumCollection {
  String? get mediaType => throw _privateConstructorUsedError;
  String? get purchaseStatus => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  Album? get album => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumCollectionCopyWith<AlbumCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumCollectionCopyWith<$Res> {
  factory $AlbumCollectionCopyWith(
          AlbumCollection value, $Res Function(AlbumCollection) then) =
      _$AlbumCollectionCopyWithImpl<$Res, AlbumCollection>;
  @useResult
  $Res call(
      {String? mediaType, String? purchaseStatus, int rating, Album? album});

  $AlbumCopyWith<$Res>? get album;
}

/// @nodoc
class _$AlbumCollectionCopyWithImpl<$Res, $Val extends AlbumCollection>
    implements $AlbumCollectionCopyWith<$Res> {
  _$AlbumCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaType = freezed,
    Object? purchaseStatus = freezed,
    Object? rating = null,
    Object? album = freezed,
  }) {
    return _then(_value.copyWith(
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      purchaseStatus: freezed == purchaseStatus
          ? _value.purchaseStatus
          : purchaseStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      album: freezed == album
          ? _value.album
          : album // ignore: cast_nullable_to_non_nullable
              as Album?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AlbumCopyWith<$Res>? get album {
    if (_value.album == null) {
      return null;
    }

    return $AlbumCopyWith<$Res>(_value.album!, (value) {
      return _then(_value.copyWith(album: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AlbumCollectionCopyWith<$Res>
    implements $AlbumCollectionCopyWith<$Res> {
  factory _$$_AlbumCollectionCopyWith(
          _$_AlbumCollection value, $Res Function(_$_AlbumCollection) then) =
      __$$_AlbumCollectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? mediaType, String? purchaseStatus, int rating, Album? album});

  @override
  $AlbumCopyWith<$Res>? get album;
}

/// @nodoc
class __$$_AlbumCollectionCopyWithImpl<$Res>
    extends _$AlbumCollectionCopyWithImpl<$Res, _$_AlbumCollection>
    implements _$$_AlbumCollectionCopyWith<$Res> {
  __$$_AlbumCollectionCopyWithImpl(
      _$_AlbumCollection _value, $Res Function(_$_AlbumCollection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaType = freezed,
    Object? purchaseStatus = freezed,
    Object? rating = null,
    Object? album = freezed,
  }) {
    return _then(_$_AlbumCollection(
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      purchaseStatus: freezed == purchaseStatus
          ? _value.purchaseStatus
          : purchaseStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      album: freezed == album
          ? _value.album
          : album // ignore: cast_nullable_to_non_nullable
              as Album?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AlbumCollection implements _AlbumCollection {
  const _$_AlbumCollection(
      {this.mediaType, this.purchaseStatus, required this.rating, this.album});

  factory _$_AlbumCollection.fromJson(Map<String, dynamic> json) =>
      _$$_AlbumCollectionFromJson(json);

  @override
  final String? mediaType;
  @override
  final String? purchaseStatus;
  @override
  final int rating;
  @override
  final Album? album;

  @override
  String toString() {
    return 'AlbumCollection(mediaType: $mediaType, purchaseStatus: $purchaseStatus, rating: $rating, album: $album)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AlbumCollection &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.purchaseStatus, purchaseStatus) ||
                other.purchaseStatus == purchaseStatus) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.album, album) || other.album == album));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, mediaType, purchaseStatus, rating, album);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AlbumCollectionCopyWith<_$_AlbumCollection> get copyWith =>
      __$$_AlbumCollectionCopyWithImpl<_$_AlbumCollection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AlbumCollectionToJson(
      this,
    );
  }
}

abstract class _AlbumCollection implements AlbumCollection {
  const factory _AlbumCollection(
      {final String? mediaType,
      final String? purchaseStatus,
      required final int rating,
      final Album? album}) = _$_AlbumCollection;

  factory _AlbumCollection.fromJson(Map<String, dynamic> json) =
      _$_AlbumCollection.fromJson;

  @override
  String? get mediaType;
  @override
  String? get purchaseStatus;
  @override
  int get rating;
  @override
  Album? get album;
  @override
  @JsonKey(ignore: true)
  _$$_AlbumCollectionCopyWith<_$_AlbumCollection> get copyWith =>
      throw _privateConstructorUsedError;
}
