// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'album_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AlbumDetailState {
  AsyncValue<Album> get album => throw _privateConstructorUsedError;
  AlbumCollection? get albumCollection => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlbumDetailStateCopyWith<AlbumDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumDetailStateCopyWith<$Res> {
  factory $AlbumDetailStateCopyWith(
          AlbumDetailState value, $Res Function(AlbumDetailState) then) =
      _$AlbumDetailStateCopyWithImpl<$Res, AlbumDetailState>;
  @useResult
  $Res call({AsyncValue<Album> album, AlbumCollection? albumCollection});

  $AlbumCollectionCopyWith<$Res>? get albumCollection;
}

/// @nodoc
class _$AlbumDetailStateCopyWithImpl<$Res, $Val extends AlbumDetailState>
    implements $AlbumDetailStateCopyWith<$Res> {
  _$AlbumDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? album = null,
    Object? albumCollection = freezed,
  }) {
    return _then(_value.copyWith(
      album: null == album
          ? _value.album
          : album // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Album>,
      albumCollection: freezed == albumCollection
          ? _value.albumCollection
          : albumCollection // ignore: cast_nullable_to_non_nullable
              as AlbumCollection?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AlbumCollectionCopyWith<$Res>? get albumCollection {
    if (_value.albumCollection == null) {
      return null;
    }

    return $AlbumCollectionCopyWith<$Res>(_value.albumCollection!, (value) {
      return _then(_value.copyWith(albumCollection: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AlbumDetailStateCopyWith<$Res>
    implements $AlbumDetailStateCopyWith<$Res> {
  factory _$$_AlbumDetailStateCopyWith(
          _$_AlbumDetailState value, $Res Function(_$_AlbumDetailState) then) =
      __$$_AlbumDetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<Album> album, AlbumCollection? albumCollection});

  @override
  $AlbumCollectionCopyWith<$Res>? get albumCollection;
}

/// @nodoc
class __$$_AlbumDetailStateCopyWithImpl<$Res>
    extends _$AlbumDetailStateCopyWithImpl<$Res, _$_AlbumDetailState>
    implements _$$_AlbumDetailStateCopyWith<$Res> {
  __$$_AlbumDetailStateCopyWithImpl(
      _$_AlbumDetailState _value, $Res Function(_$_AlbumDetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? album = null,
    Object? albumCollection = freezed,
  }) {
    return _then(_$_AlbumDetailState(
      album: null == album
          ? _value.album
          : album // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Album>,
      albumCollection: freezed == albumCollection
          ? _value.albumCollection
          : albumCollection // ignore: cast_nullable_to_non_nullable
              as AlbumCollection?,
    ));
  }
}

/// @nodoc

class _$_AlbumDetailState implements _AlbumDetailState {
  const _$_AlbumDetailState({required this.album, this.albumCollection});

  @override
  final AsyncValue<Album> album;
  @override
  final AlbumCollection? albumCollection;

  @override
  String toString() {
    return 'AlbumDetailState(album: $album, albumCollection: $albumCollection)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AlbumDetailState &&
            (identical(other.album, album) || other.album == album) &&
            (identical(other.albumCollection, albumCollection) ||
                other.albumCollection == albumCollection));
  }

  @override
  int get hashCode => Object.hash(runtimeType, album, albumCollection);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AlbumDetailStateCopyWith<_$_AlbumDetailState> get copyWith =>
      __$$_AlbumDetailStateCopyWithImpl<_$_AlbumDetailState>(this, _$identity);
}

abstract class _AlbumDetailState implements AlbumDetailState {
  const factory _AlbumDetailState(
      {required final AsyncValue<Album> album,
      final AlbumCollection? albumCollection}) = _$_AlbumDetailState;

  @override
  AsyncValue<Album> get album;
  @override
  AlbumCollection? get albumCollection;
  @override
  @JsonKey(ignore: true)
  _$$_AlbumDetailStateCopyWith<_$_AlbumDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
