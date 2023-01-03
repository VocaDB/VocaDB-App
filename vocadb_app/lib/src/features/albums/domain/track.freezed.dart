// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'track.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Track _$TrackFromJson(Map<String, dynamic> json) {
  return _Track.fromJson(json);
}

/// @nodoc
mixin _$Track {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int get discNumber => throw _privateConstructorUsedError;
  int get trackNumber => throw _privateConstructorUsedError;
  Song? get song => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrackCopyWith<Track> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackCopyWith<$Res> {
  factory $TrackCopyWith(Track value, $Res Function(Track) then) =
      _$TrackCopyWithImpl<$Res, Track>;
  @useResult
  $Res call(
      {int id, String? name, int discNumber, int trackNumber, Song? song});

  $SongCopyWith<$Res>? get song;
}

/// @nodoc
class _$TrackCopyWithImpl<$Res, $Val extends Track>
    implements $TrackCopyWith<$Res> {
  _$TrackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? discNumber = null,
    Object? trackNumber = null,
    Object? song = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      discNumber: null == discNumber
          ? _value.discNumber
          : discNumber // ignore: cast_nullable_to_non_nullable
              as int,
      trackNumber: null == trackNumber
          ? _value.trackNumber
          : trackNumber // ignore: cast_nullable_to_non_nullable
              as int,
      song: freezed == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as Song?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SongCopyWith<$Res>? get song {
    if (_value.song == null) {
      return null;
    }

    return $SongCopyWith<$Res>(_value.song!, (value) {
      return _then(_value.copyWith(song: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TrackCopyWith<$Res> implements $TrackCopyWith<$Res> {
  factory _$$_TrackCopyWith(_$_Track value, $Res Function(_$_Track) then) =
      __$$_TrackCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String? name, int discNumber, int trackNumber, Song? song});

  @override
  $SongCopyWith<$Res>? get song;
}

/// @nodoc
class __$$_TrackCopyWithImpl<$Res> extends _$TrackCopyWithImpl<$Res, _$_Track>
    implements _$$_TrackCopyWith<$Res> {
  __$$_TrackCopyWithImpl(_$_Track _value, $Res Function(_$_Track) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? discNumber = null,
    Object? trackNumber = null,
    Object? song = freezed,
  }) {
    return _then(_$_Track(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      discNumber: null == discNumber
          ? _value.discNumber
          : discNumber // ignore: cast_nullable_to_non_nullable
              as int,
      trackNumber: null == trackNumber
          ? _value.trackNumber
          : trackNumber // ignore: cast_nullable_to_non_nullable
              as int,
      song: freezed == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as Song?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Track implements _Track {
  _$_Track(
      {required this.id,
      this.name = '',
      this.discNumber = 0,
      this.trackNumber = 0,
      this.song});

  factory _$_Track.fromJson(Map<String, dynamic> json) =>
      _$$_TrackFromJson(json);

  @override
  final int id;
  @override
  @JsonKey()
  final String? name;
  @override
  @JsonKey()
  final int discNumber;
  @override
  @JsonKey()
  final int trackNumber;
  @override
  final Song? song;

  @override
  String toString() {
    return 'Track(id: $id, name: $name, discNumber: $discNumber, trackNumber: $trackNumber, song: $song)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Track &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.discNumber, discNumber) ||
                other.discNumber == discNumber) &&
            (identical(other.trackNumber, trackNumber) ||
                other.trackNumber == trackNumber) &&
            (identical(other.song, song) || other.song == song));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, discNumber, trackNumber, song);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TrackCopyWith<_$_Track> get copyWith =>
      __$$_TrackCopyWithImpl<_$_Track>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TrackToJson(
      this,
    );
  }
}

abstract class _Track implements Track {
  factory _Track(
      {required final int id,
      final String? name,
      final int discNumber,
      final int trackNumber,
      final Song? song}) = _$_Track;

  factory _Track.fromJson(Map<String, dynamic> json) = _$_Track.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  int get discNumber;
  @override
  int get trackNumber;
  @override
  Song? get song;
  @override
  @JsonKey(ignore: true)
  _$$_TrackCopyWith<_$_Track> get copyWith =>
      throw _privateConstructorUsedError;
}
