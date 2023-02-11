// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'song_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SongDetailState {
  AsyncValue<Song> get song => throw _privateConstructorUsedError;
  AsyncValue<SongRelated> get relatedSongs =>
      throw _privateConstructorUsedError;
  AsyncValue<List<Song>> get derivedSongs => throw _privateConstructorUsedError;
  bool get showLyricContent => throw _privateConstructorUsedError;
  AsyncValue<String?> get rating => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SongDetailStateCopyWith<SongDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongDetailStateCopyWith<$Res> {
  factory $SongDetailStateCopyWith(
          SongDetailState value, $Res Function(SongDetailState) then) =
      _$SongDetailStateCopyWithImpl<$Res, SongDetailState>;
  @useResult
  $Res call(
      {AsyncValue<Song> song,
      AsyncValue<SongRelated> relatedSongs,
      AsyncValue<List<Song>> derivedSongs,
      bool showLyricContent,
      AsyncValue<String?> rating});
}

/// @nodoc
class _$SongDetailStateCopyWithImpl<$Res, $Val extends SongDetailState>
    implements $SongDetailStateCopyWith<$Res> {
  _$SongDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? song = null,
    Object? relatedSongs = null,
    Object? derivedSongs = null,
    Object? showLyricContent = null,
    Object? rating = null,
  }) {
    return _then(_value.copyWith(
      song: null == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Song>,
      relatedSongs: null == relatedSongs
          ? _value.relatedSongs
          : relatedSongs // ignore: cast_nullable_to_non_nullable
              as AsyncValue<SongRelated>,
      derivedSongs: null == derivedSongs
          ? _value.derivedSongs
          : derivedSongs // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Song>>,
      showLyricContent: null == showLyricContent
          ? _value.showLyricContent
          : showLyricContent // ignore: cast_nullable_to_non_nullable
              as bool,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as AsyncValue<String?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SongDetailStateCopyWith<$Res>
    implements $SongDetailStateCopyWith<$Res> {
  factory _$$_SongDetailStateCopyWith(
          _$_SongDetailState value, $Res Function(_$_SongDetailState) then) =
      __$$_SongDetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<Song> song,
      AsyncValue<SongRelated> relatedSongs,
      AsyncValue<List<Song>> derivedSongs,
      bool showLyricContent,
      AsyncValue<String?> rating});
}

/// @nodoc
class __$$_SongDetailStateCopyWithImpl<$Res>
    extends _$SongDetailStateCopyWithImpl<$Res, _$_SongDetailState>
    implements _$$_SongDetailStateCopyWith<$Res> {
  __$$_SongDetailStateCopyWithImpl(
      _$_SongDetailState _value, $Res Function(_$_SongDetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? song = null,
    Object? relatedSongs = null,
    Object? derivedSongs = null,
    Object? showLyricContent = null,
    Object? rating = null,
  }) {
    return _then(_$_SongDetailState(
      song: null == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Song>,
      relatedSongs: null == relatedSongs
          ? _value.relatedSongs
          : relatedSongs // ignore: cast_nullable_to_non_nullable
              as AsyncValue<SongRelated>,
      derivedSongs: null == derivedSongs
          ? _value.derivedSongs
          : derivedSongs // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Song>>,
      showLyricContent: null == showLyricContent
          ? _value.showLyricContent
          : showLyricContent // ignore: cast_nullable_to_non_nullable
              as bool,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as AsyncValue<String?>,
    ));
  }
}

/// @nodoc

class _$_SongDetailState implements _SongDetailState {
  const _$_SongDetailState(
      {required this.song,
      this.relatedSongs = const AsyncValue.data(SongRelated()),
      this.derivedSongs = const AsyncValue.data([]),
      this.showLyricContent = false,
      this.rating = const AsyncValue.data(null)});

  @override
  final AsyncValue<Song> song;
  @override
  @JsonKey()
  final AsyncValue<SongRelated> relatedSongs;
  @override
  @JsonKey()
  final AsyncValue<List<Song>> derivedSongs;
  @override
  @JsonKey()
  final bool showLyricContent;
  @override
  @JsonKey()
  final AsyncValue<String?> rating;

  @override
  String toString() {
    return 'SongDetailState(song: $song, relatedSongs: $relatedSongs, derivedSongs: $derivedSongs, showLyricContent: $showLyricContent, rating: $rating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SongDetailState &&
            (identical(other.song, song) || other.song == song) &&
            (identical(other.relatedSongs, relatedSongs) ||
                other.relatedSongs == relatedSongs) &&
            (identical(other.derivedSongs, derivedSongs) ||
                other.derivedSongs == derivedSongs) &&
            (identical(other.showLyricContent, showLyricContent) ||
                other.showLyricContent == showLyricContent) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, song, relatedSongs, derivedSongs, showLyricContent, rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SongDetailStateCopyWith<_$_SongDetailState> get copyWith =>
      __$$_SongDetailStateCopyWithImpl<_$_SongDetailState>(this, _$identity);
}

abstract class _SongDetailState implements SongDetailState {
  const factory _SongDetailState(
      {required final AsyncValue<Song> song,
      final AsyncValue<SongRelated> relatedSongs,
      final AsyncValue<List<Song>> derivedSongs,
      final bool showLyricContent,
      final AsyncValue<String?> rating}) = _$_SongDetailState;

  @override
  AsyncValue<Song> get song;
  @override
  AsyncValue<SongRelated> get relatedSongs;
  @override
  AsyncValue<List<Song>> get derivedSongs;
  @override
  bool get showLyricContent;
  @override
  AsyncValue<String?> get rating;
  @override
  @JsonKey(ignore: true)
  _$$_SongDetailStateCopyWith<_$_SongDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
