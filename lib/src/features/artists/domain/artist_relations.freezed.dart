// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'artist_relations.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArtistRelations _$ArtistRelationsFromJson(Map<String, dynamic> json) {
  return _ArtistRelations.fromJson(json);
}

/// @nodoc
mixin _$ArtistRelations {
  List<Song> get latestSongs => throw _privateConstructorUsedError;
  List<Song> get popularSongs => throw _privateConstructorUsedError;
  List<Album> get latestAlbums => throw _privateConstructorUsedError;
  List<Album> get popularAlbums => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtistRelationsCopyWith<ArtistRelations> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistRelationsCopyWith<$Res> {
  factory $ArtistRelationsCopyWith(
          ArtistRelations value, $Res Function(ArtistRelations) then) =
      _$ArtistRelationsCopyWithImpl<$Res, ArtistRelations>;
  @useResult
  $Res call(
      {List<Song> latestSongs,
      List<Song> popularSongs,
      List<Album> latestAlbums,
      List<Album> popularAlbums});
}

/// @nodoc
class _$ArtistRelationsCopyWithImpl<$Res, $Val extends ArtistRelations>
    implements $ArtistRelationsCopyWith<$Res> {
  _$ArtistRelationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latestSongs = null,
    Object? popularSongs = null,
    Object? latestAlbums = null,
    Object? popularAlbums = null,
  }) {
    return _then(_value.copyWith(
      latestSongs: null == latestSongs
          ? _value.latestSongs
          : latestSongs // ignore: cast_nullable_to_non_nullable
              as List<Song>,
      popularSongs: null == popularSongs
          ? _value.popularSongs
          : popularSongs // ignore: cast_nullable_to_non_nullable
              as List<Song>,
      latestAlbums: null == latestAlbums
          ? _value.latestAlbums
          : latestAlbums // ignore: cast_nullable_to_non_nullable
              as List<Album>,
      popularAlbums: null == popularAlbums
          ? _value.popularAlbums
          : popularAlbums // ignore: cast_nullable_to_non_nullable
              as List<Album>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ArtistRelationsCopyWith<$Res>
    implements $ArtistRelationsCopyWith<$Res> {
  factory _$$_ArtistRelationsCopyWith(
          _$_ArtistRelations value, $Res Function(_$_ArtistRelations) then) =
      __$$_ArtistRelationsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Song> latestSongs,
      List<Song> popularSongs,
      List<Album> latestAlbums,
      List<Album> popularAlbums});
}

/// @nodoc
class __$$_ArtistRelationsCopyWithImpl<$Res>
    extends _$ArtistRelationsCopyWithImpl<$Res, _$_ArtistRelations>
    implements _$$_ArtistRelationsCopyWith<$Res> {
  __$$_ArtistRelationsCopyWithImpl(
      _$_ArtistRelations _value, $Res Function(_$_ArtistRelations) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latestSongs = null,
    Object? popularSongs = null,
    Object? latestAlbums = null,
    Object? popularAlbums = null,
  }) {
    return _then(_$_ArtistRelations(
      latestSongs: null == latestSongs
          ? _value._latestSongs
          : latestSongs // ignore: cast_nullable_to_non_nullable
              as List<Song>,
      popularSongs: null == popularSongs
          ? _value._popularSongs
          : popularSongs // ignore: cast_nullable_to_non_nullable
              as List<Song>,
      latestAlbums: null == latestAlbums
          ? _value._latestAlbums
          : latestAlbums // ignore: cast_nullable_to_non_nullable
              as List<Album>,
      popularAlbums: null == popularAlbums
          ? _value._popularAlbums
          : popularAlbums // ignore: cast_nullable_to_non_nullable
              as List<Album>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ArtistRelations implements _ArtistRelations {
  _$_ArtistRelations(
      {final List<Song> latestSongs = const [],
      final List<Song> popularSongs = const [],
      final List<Album> latestAlbums = const [],
      final List<Album> popularAlbums = const []})
      : _latestSongs = latestSongs,
        _popularSongs = popularSongs,
        _latestAlbums = latestAlbums,
        _popularAlbums = popularAlbums;

  factory _$_ArtistRelations.fromJson(Map<String, dynamic> json) =>
      _$$_ArtistRelationsFromJson(json);

  final List<Song> _latestSongs;
  @override
  @JsonKey()
  List<Song> get latestSongs {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_latestSongs);
  }

  final List<Song> _popularSongs;
  @override
  @JsonKey()
  List<Song> get popularSongs {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_popularSongs);
  }

  final List<Album> _latestAlbums;
  @override
  @JsonKey()
  List<Album> get latestAlbums {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_latestAlbums);
  }

  final List<Album> _popularAlbums;
  @override
  @JsonKey()
  List<Album> get popularAlbums {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_popularAlbums);
  }

  @override
  String toString() {
    return 'ArtistRelations(latestSongs: $latestSongs, popularSongs: $popularSongs, latestAlbums: $latestAlbums, popularAlbums: $popularAlbums)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArtistRelations &&
            const DeepCollectionEquality()
                .equals(other._latestSongs, _latestSongs) &&
            const DeepCollectionEquality()
                .equals(other._popularSongs, _popularSongs) &&
            const DeepCollectionEquality()
                .equals(other._latestAlbums, _latestAlbums) &&
            const DeepCollectionEquality()
                .equals(other._popularAlbums, _popularAlbums));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_latestSongs),
      const DeepCollectionEquality().hash(_popularSongs),
      const DeepCollectionEquality().hash(_latestAlbums),
      const DeepCollectionEquality().hash(_popularAlbums));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArtistRelationsCopyWith<_$_ArtistRelations> get copyWith =>
      __$$_ArtistRelationsCopyWithImpl<_$_ArtistRelations>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArtistRelationsToJson(
      this,
    );
  }
}

abstract class _ArtistRelations implements ArtistRelations {
  factory _ArtistRelations(
      {final List<Song> latestSongs,
      final List<Song> popularSongs,
      final List<Album> latestAlbums,
      final List<Album> popularAlbums}) = _$_ArtistRelations;

  factory _ArtistRelations.fromJson(Map<String, dynamic> json) =
      _$_ArtistRelations.fromJson;

  @override
  List<Song> get latestSongs;
  @override
  List<Song> get popularSongs;
  @override
  List<Album> get latestAlbums;
  @override
  List<Album> get popularAlbums;
  @override
  @JsonKey(ignore: true)
  _$$_ArtistRelationsCopyWith<_$_ArtistRelations> get copyWith =>
      throw _privateConstructorUsedError;
}
