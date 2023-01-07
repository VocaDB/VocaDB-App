// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'song_related.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SongRelated _$SongRelatedFromJson(Map<String, dynamic> json) {
  return _SongRelated.fromJson(json);
}

/// @nodoc
mixin _$SongRelated {
  List<Song> get artistMatches => throw _privateConstructorUsedError;
  List<Song> get likeMatches => throw _privateConstructorUsedError;
  List<Song> get tagMatches => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SongRelatedCopyWith<SongRelated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongRelatedCopyWith<$Res> {
  factory $SongRelatedCopyWith(
          SongRelated value, $Res Function(SongRelated) then) =
      _$SongRelatedCopyWithImpl<$Res, SongRelated>;
  @useResult
  $Res call(
      {List<Song> artistMatches,
      List<Song> likeMatches,
      List<Song> tagMatches});
}

/// @nodoc
class _$SongRelatedCopyWithImpl<$Res, $Val extends SongRelated>
    implements $SongRelatedCopyWith<$Res> {
  _$SongRelatedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artistMatches = null,
    Object? likeMatches = null,
    Object? tagMatches = null,
  }) {
    return _then(_value.copyWith(
      artistMatches: null == artistMatches
          ? _value.artistMatches
          : artistMatches // ignore: cast_nullable_to_non_nullable
              as List<Song>,
      likeMatches: null == likeMatches
          ? _value.likeMatches
          : likeMatches // ignore: cast_nullable_to_non_nullable
              as List<Song>,
      tagMatches: null == tagMatches
          ? _value.tagMatches
          : tagMatches // ignore: cast_nullable_to_non_nullable
              as List<Song>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SongRelatedCopyWith<$Res>
    implements $SongRelatedCopyWith<$Res> {
  factory _$$_SongRelatedCopyWith(
          _$_SongRelated value, $Res Function(_$_SongRelated) then) =
      __$$_SongRelatedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Song> artistMatches,
      List<Song> likeMatches,
      List<Song> tagMatches});
}

/// @nodoc
class __$$_SongRelatedCopyWithImpl<$Res>
    extends _$SongRelatedCopyWithImpl<$Res, _$_SongRelated>
    implements _$$_SongRelatedCopyWith<$Res> {
  __$$_SongRelatedCopyWithImpl(
      _$_SongRelated _value, $Res Function(_$_SongRelated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artistMatches = null,
    Object? likeMatches = null,
    Object? tagMatches = null,
  }) {
    return _then(_$_SongRelated(
      artistMatches: null == artistMatches
          ? _value._artistMatches
          : artistMatches // ignore: cast_nullable_to_non_nullable
              as List<Song>,
      likeMatches: null == likeMatches
          ? _value._likeMatches
          : likeMatches // ignore: cast_nullable_to_non_nullable
              as List<Song>,
      tagMatches: null == tagMatches
          ? _value._tagMatches
          : tagMatches // ignore: cast_nullable_to_non_nullable
              as List<Song>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SongRelated implements _SongRelated {
  _$_SongRelated(
      {final List<Song> artistMatches = const [],
      final List<Song> likeMatches = const [],
      final List<Song> tagMatches = const []})
      : _artistMatches = artistMatches,
        _likeMatches = likeMatches,
        _tagMatches = tagMatches;

  factory _$_SongRelated.fromJson(Map<String, dynamic> json) =>
      _$$_SongRelatedFromJson(json);

  final List<Song> _artistMatches;
  @override
  @JsonKey()
  List<Song> get artistMatches {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artistMatches);
  }

  final List<Song> _likeMatches;
  @override
  @JsonKey()
  List<Song> get likeMatches {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likeMatches);
  }

  final List<Song> _tagMatches;
  @override
  @JsonKey()
  List<Song> get tagMatches {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tagMatches);
  }

  @override
  String toString() {
    return 'SongRelated(artistMatches: $artistMatches, likeMatches: $likeMatches, tagMatches: $tagMatches)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SongRelated &&
            const DeepCollectionEquality()
                .equals(other._artistMatches, _artistMatches) &&
            const DeepCollectionEquality()
                .equals(other._likeMatches, _likeMatches) &&
            const DeepCollectionEquality()
                .equals(other._tagMatches, _tagMatches));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_artistMatches),
      const DeepCollectionEquality().hash(_likeMatches),
      const DeepCollectionEquality().hash(_tagMatches));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SongRelatedCopyWith<_$_SongRelated> get copyWith =>
      __$$_SongRelatedCopyWithImpl<_$_SongRelated>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SongRelatedToJson(
      this,
    );
  }
}

abstract class _SongRelated implements SongRelated {
  factory _SongRelated(
      {final List<Song> artistMatches,
      final List<Song> likeMatches,
      final List<Song> tagMatches}) = _$_SongRelated;

  factory _SongRelated.fromJson(Map<String, dynamic> json) =
      _$_SongRelated.fromJson;

  @override
  List<Song> get artistMatches;
  @override
  List<Song> get likeMatches;
  @override
  List<Song> get tagMatches;
  @override
  @JsonKey(ignore: true)
  _$$_SongRelatedCopyWith<_$_SongRelated> get copyWith =>
      throw _privateConstructorUsedError;
}
