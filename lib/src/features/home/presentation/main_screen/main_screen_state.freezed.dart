// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'main_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainScreenState {
  int get tabIndex => throw _privateConstructorUsedError;
  AsyncValue<List<ReleaseEvent>>? get recentEvents =>
      throw _privateConstructorUsedError;
  AsyncValue<List<Song>>? get highlightedSongs =>
      throw _privateConstructorUsedError;
  AsyncValue<List<Album>>? get topAlbums => throw _privateConstructorUsedError;
  AsyncValue<List<Album>>? get newAlbums => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainScreenStateCopyWith<MainScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainScreenStateCopyWith<$Res> {
  factory $MainScreenStateCopyWith(
          MainScreenState value, $Res Function(MainScreenState) then) =
      _$MainScreenStateCopyWithImpl<$Res, MainScreenState>;
  @useResult
  $Res call(
      {int tabIndex,
      AsyncValue<List<ReleaseEvent>>? recentEvents,
      AsyncValue<List<Song>>? highlightedSongs,
      AsyncValue<List<Album>>? topAlbums,
      AsyncValue<List<Album>>? newAlbums});
}

/// @nodoc
class _$MainScreenStateCopyWithImpl<$Res, $Val extends MainScreenState>
    implements $MainScreenStateCopyWith<$Res> {
  _$MainScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabIndex = null,
    Object? recentEvents = freezed,
    Object? highlightedSongs = freezed,
    Object? topAlbums = freezed,
    Object? newAlbums = freezed,
  }) {
    return _then(_value.copyWith(
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      recentEvents: freezed == recentEvents
          ? _value.recentEvents
          : recentEvents // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ReleaseEvent>>?,
      highlightedSongs: freezed == highlightedSongs
          ? _value.highlightedSongs
          : highlightedSongs // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Song>>?,
      topAlbums: freezed == topAlbums
          ? _value.topAlbums
          : topAlbums // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Album>>?,
      newAlbums: freezed == newAlbums
          ? _value.newAlbums
          : newAlbums // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Album>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MainScreenStateCopyWith<$Res>
    implements $MainScreenStateCopyWith<$Res> {
  factory _$$_MainScreenStateCopyWith(
          _$_MainScreenState value, $Res Function(_$_MainScreenState) then) =
      __$$_MainScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int tabIndex,
      AsyncValue<List<ReleaseEvent>>? recentEvents,
      AsyncValue<List<Song>>? highlightedSongs,
      AsyncValue<List<Album>>? topAlbums,
      AsyncValue<List<Album>>? newAlbums});
}

/// @nodoc
class __$$_MainScreenStateCopyWithImpl<$Res>
    extends _$MainScreenStateCopyWithImpl<$Res, _$_MainScreenState>
    implements _$$_MainScreenStateCopyWith<$Res> {
  __$$_MainScreenStateCopyWithImpl(
      _$_MainScreenState _value, $Res Function(_$_MainScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabIndex = null,
    Object? recentEvents = freezed,
    Object? highlightedSongs = freezed,
    Object? topAlbums = freezed,
    Object? newAlbums = freezed,
  }) {
    return _then(_$_MainScreenState(
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      recentEvents: freezed == recentEvents
          ? _value.recentEvents
          : recentEvents // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ReleaseEvent>>?,
      highlightedSongs: freezed == highlightedSongs
          ? _value.highlightedSongs
          : highlightedSongs // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Song>>?,
      topAlbums: freezed == topAlbums
          ? _value.topAlbums
          : topAlbums // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Album>>?,
      newAlbums: freezed == newAlbums
          ? _value.newAlbums
          : newAlbums // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Album>>?,
    ));
  }
}

/// @nodoc

class _$_MainScreenState implements _MainScreenState {
  _$_MainScreenState(
      {this.tabIndex = 0,
      this.recentEvents,
      this.highlightedSongs,
      this.topAlbums,
      this.newAlbums});

  @override
  @JsonKey()
  final int tabIndex;
  @override
  final AsyncValue<List<ReleaseEvent>>? recentEvents;
  @override
  final AsyncValue<List<Song>>? highlightedSongs;
  @override
  final AsyncValue<List<Album>>? topAlbums;
  @override
  final AsyncValue<List<Album>>? newAlbums;

  @override
  String toString() {
    return 'MainScreenState(tabIndex: $tabIndex, recentEvents: $recentEvents, highlightedSongs: $highlightedSongs, topAlbums: $topAlbums, newAlbums: $newAlbums)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainScreenState &&
            (identical(other.tabIndex, tabIndex) ||
                other.tabIndex == tabIndex) &&
            (identical(other.recentEvents, recentEvents) ||
                other.recentEvents == recentEvents) &&
            (identical(other.highlightedSongs, highlightedSongs) ||
                other.highlightedSongs == highlightedSongs) &&
            (identical(other.topAlbums, topAlbums) ||
                other.topAlbums == topAlbums) &&
            (identical(other.newAlbums, newAlbums) ||
                other.newAlbums == newAlbums));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tabIndex, recentEvents,
      highlightedSongs, topAlbums, newAlbums);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainScreenStateCopyWith<_$_MainScreenState> get copyWith =>
      __$$_MainScreenStateCopyWithImpl<_$_MainScreenState>(this, _$identity);
}

abstract class _MainScreenState implements MainScreenState {
  factory _MainScreenState(
      {final int tabIndex,
      final AsyncValue<List<ReleaseEvent>>? recentEvents,
      final AsyncValue<List<Song>>? highlightedSongs,
      final AsyncValue<List<Album>>? topAlbums,
      final AsyncValue<List<Album>>? newAlbums}) = _$_MainScreenState;

  @override
  int get tabIndex;
  @override
  AsyncValue<List<ReleaseEvent>>? get recentEvents;
  @override
  AsyncValue<List<Song>>? get highlightedSongs;
  @override
  AsyncValue<List<Album>>? get topAlbums;
  @override
  AsyncValue<List<Album>>? get newAlbums;
  @override
  @JsonKey(ignore: true)
  _$$_MainScreenStateCopyWith<_$_MainScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
