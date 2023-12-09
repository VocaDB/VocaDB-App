// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'followed_artist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FollowedArtist _$FollowedArtistFromJson(Map<String, dynamic> json) {
  return _FollowedArtist.fromJson(json);
}

/// @nodoc
mixin _$FollowedArtist {
  int get id => throw _privateConstructorUsedError;
  Artist get artist => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowedArtistCopyWith<FollowedArtist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowedArtistCopyWith<$Res> {
  factory $FollowedArtistCopyWith(
          FollowedArtist value, $Res Function(FollowedArtist) then) =
      _$FollowedArtistCopyWithImpl<$Res, FollowedArtist>;
  @useResult
  $Res call({int id, Artist artist});

  $ArtistCopyWith<$Res> get artist;
}

/// @nodoc
class _$FollowedArtistCopyWithImpl<$Res, $Val extends FollowedArtist>
    implements $FollowedArtistCopyWith<$Res> {
  _$FollowedArtistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? artist = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as Artist,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ArtistCopyWith<$Res> get artist {
    return $ArtistCopyWith<$Res>(_value.artist, (value) {
      return _then(_value.copyWith(artist: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FollowedArtistCopyWith<$Res>
    implements $FollowedArtistCopyWith<$Res> {
  factory _$$_FollowedArtistCopyWith(
          _$_FollowedArtist value, $Res Function(_$_FollowedArtist) then) =
      __$$_FollowedArtistCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, Artist artist});

  @override
  $ArtistCopyWith<$Res> get artist;
}

/// @nodoc
class __$$_FollowedArtistCopyWithImpl<$Res>
    extends _$FollowedArtistCopyWithImpl<$Res, _$_FollowedArtist>
    implements _$$_FollowedArtistCopyWith<$Res> {
  __$$_FollowedArtistCopyWithImpl(
      _$_FollowedArtist _value, $Res Function(_$_FollowedArtist) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? artist = null,
  }) {
    return _then(_$_FollowedArtist(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as Artist,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FollowedArtist implements _FollowedArtist {
  _$_FollowedArtist({required this.id, required this.artist});

  factory _$_FollowedArtist.fromJson(Map<String, dynamic> json) =>
      _$$_FollowedArtistFromJson(json);

  @override
  final int id;
  @override
  final Artist artist;

  @override
  String toString() {
    return 'FollowedArtist(id: $id, artist: $artist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FollowedArtist &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.artist, artist) || other.artist == artist));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, artist);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FollowedArtistCopyWith<_$_FollowedArtist> get copyWith =>
      __$$_FollowedArtistCopyWithImpl<_$_FollowedArtist>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FollowedArtistToJson(
      this,
    );
  }
}

abstract class _FollowedArtist implements FollowedArtist {
  factory _FollowedArtist(
      {required final int id,
      required final Artist artist}) = _$_FollowedArtist;

  factory _FollowedArtist.fromJson(Map<String, dynamic> json) =
      _$_FollowedArtist.fromJson;

  @override
  int get id;
  @override
  Artist get artist;
  @override
  @JsonKey(ignore: true)
  _$$_FollowedArtistCopyWith<_$_FollowedArtist> get copyWith =>
      throw _privateConstructorUsedError;
}
