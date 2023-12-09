// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rated_song.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RatedSong _$RatedSongFromJson(Map<String, dynamic> json) {
  return _RatedSong.fromJson(json);
}

/// @nodoc
mixin _$RatedSong {
  String get rating => throw _privateConstructorUsedError;
  Song get song => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RatedSongCopyWith<RatedSong> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatedSongCopyWith<$Res> {
  factory $RatedSongCopyWith(RatedSong value, $Res Function(RatedSong) then) =
      _$RatedSongCopyWithImpl<$Res, RatedSong>;
  @useResult
  $Res call({String rating, Song song});

  $SongCopyWith<$Res> get song;
}

/// @nodoc
class _$RatedSongCopyWithImpl<$Res, $Val extends RatedSong>
    implements $RatedSongCopyWith<$Res> {
  _$RatedSongCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = null,
    Object? song = null,
  }) {
    return _then(_value.copyWith(
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      song: null == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as Song,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SongCopyWith<$Res> get song {
    return $SongCopyWith<$Res>(_value.song, (value) {
      return _then(_value.copyWith(song: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RatedSongCopyWith<$Res> implements $RatedSongCopyWith<$Res> {
  factory _$$_RatedSongCopyWith(
          _$_RatedSong value, $Res Function(_$_RatedSong) then) =
      __$$_RatedSongCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String rating, Song song});

  @override
  $SongCopyWith<$Res> get song;
}

/// @nodoc
class __$$_RatedSongCopyWithImpl<$Res>
    extends _$RatedSongCopyWithImpl<$Res, _$_RatedSong>
    implements _$$_RatedSongCopyWith<$Res> {
  __$$_RatedSongCopyWithImpl(
      _$_RatedSong _value, $Res Function(_$_RatedSong) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = null,
    Object? song = null,
  }) {
    return _then(_$_RatedSong(
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      song: null == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as Song,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RatedSong implements _RatedSong {
  _$_RatedSong({required this.rating, required this.song});

  factory _$_RatedSong.fromJson(Map<String, dynamic> json) =>
      _$$_RatedSongFromJson(json);

  @override
  final String rating;
  @override
  final Song song;

  @override
  String toString() {
    return 'RatedSong(rating: $rating, song: $song)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RatedSong &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.song, song) || other.song == song));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rating, song);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RatedSongCopyWith<_$_RatedSong> get copyWith =>
      __$$_RatedSongCopyWithImpl<_$_RatedSong>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RatedSongToJson(
      this,
    );
  }
}

abstract class _RatedSong implements RatedSong {
  factory _RatedSong({required final String rating, required final Song song}) =
      _$_RatedSong;

  factory _RatedSong.fromJson(Map<String, dynamic> json) =
      _$_RatedSong.fromJson;

  @override
  String get rating;
  @override
  Song get song;
  @override
  @JsonKey(ignore: true)
  _$$_RatedSongCopyWith<_$_RatedSong> get copyWith =>
      throw _privateConstructorUsedError;
}
