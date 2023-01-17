// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'songs_list_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SongsListParams _$SongsListParamsFromJson(Map<String, dynamic> json) {
  return _SongsListParams.fromJson(json);
}

/// @nodoc
mixin _$SongsListParams {
  String? get query => throw _privateConstructorUsedError;
  String? get songTypes => throw _privateConstructorUsedError;
  String get sort => throw _privateConstructorUsedError;
  @JsonKey(name: 'artistId')
  List<int>? get artistId => throw _privateConstructorUsedError;
  @JsonKey(name: 'tagId[]')
  List<int>? get tagId => throw _privateConstructorUsedError;
  int get start => throw _privateConstructorUsedError;
  int get maxResults => throw _privateConstructorUsedError;
  String get fields => throw _privateConstructorUsedError;
  String get lang => throw _privateConstructorUsedError;
  String get nameMatchMode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SongsListParamsCopyWith<SongsListParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongsListParamsCopyWith<$Res> {
  factory $SongsListParamsCopyWith(
          SongsListParams value, $Res Function(SongsListParams) then) =
      _$SongsListParamsCopyWithImpl<$Res, SongsListParams>;
  @useResult
  $Res call(
      {String? query,
      String? songTypes,
      String sort,
      @JsonKey(name: 'artistId') List<int>? artistId,
      @JsonKey(name: 'tagId[]') List<int>? tagId,
      int start,
      int maxResults,
      String fields,
      String lang,
      String nameMatchMode});
}

/// @nodoc
class _$SongsListParamsCopyWithImpl<$Res, $Val extends SongsListParams>
    implements $SongsListParamsCopyWith<$Res> {
  _$SongsListParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
    Object? songTypes = freezed,
    Object? sort = null,
    Object? artistId = freezed,
    Object? tagId = freezed,
    Object? start = null,
    Object? maxResults = null,
    Object? fields = null,
    Object? lang = null,
    Object? nameMatchMode = null,
  }) {
    return _then(_value.copyWith(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      songTypes: freezed == songTypes
          ? _value.songTypes
          : songTypes // ignore: cast_nullable_to_non_nullable
              as String?,
      sort: null == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String,
      artistId: freezed == artistId
          ? _value.artistId
          : artistId // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      tagId: freezed == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      maxResults: null == maxResults
          ? _value.maxResults
          : maxResults // ignore: cast_nullable_to_non_nullable
              as int,
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as String,
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      nameMatchMode: null == nameMatchMode
          ? _value.nameMatchMode
          : nameMatchMode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SongsListParamsCopyWith<$Res>
    implements $SongsListParamsCopyWith<$Res> {
  factory _$$_SongsListParamsCopyWith(
          _$_SongsListParams value, $Res Function(_$_SongsListParams) then) =
      __$$_SongsListParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? query,
      String? songTypes,
      String sort,
      @JsonKey(name: 'artistId') List<int>? artistId,
      @JsonKey(name: 'tagId[]') List<int>? tagId,
      int start,
      int maxResults,
      String fields,
      String lang,
      String nameMatchMode});
}

/// @nodoc
class __$$_SongsListParamsCopyWithImpl<$Res>
    extends _$SongsListParamsCopyWithImpl<$Res, _$_SongsListParams>
    implements _$$_SongsListParamsCopyWith<$Res> {
  __$$_SongsListParamsCopyWithImpl(
      _$_SongsListParams _value, $Res Function(_$_SongsListParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
    Object? songTypes = freezed,
    Object? sort = null,
    Object? artistId = freezed,
    Object? tagId = freezed,
    Object? start = null,
    Object? maxResults = null,
    Object? fields = null,
    Object? lang = null,
    Object? nameMatchMode = null,
  }) {
    return _then(_$_SongsListParams(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      songTypes: freezed == songTypes
          ? _value.songTypes
          : songTypes // ignore: cast_nullable_to_non_nullable
              as String?,
      sort: null == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String,
      artistId: freezed == artistId
          ? _value._artistId
          : artistId // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      tagId: freezed == tagId
          ? _value._tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      maxResults: null == maxResults
          ? _value.maxResults
          : maxResults // ignore: cast_nullable_to_non_nullable
              as int,
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as String,
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      nameMatchMode: null == nameMatchMode
          ? _value.nameMatchMode
          : nameMatchMode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_SongsListParams implements _SongsListParams {
  const _$_SongsListParams(
      {this.query,
      this.songTypes,
      this.sort = 'None',
      @JsonKey(name: 'artistId') final List<int>? artistId,
      @JsonKey(name: 'tagId[]') final List<int>? tagId,
      this.start = 0,
      this.maxResults = 10,
      this.fields = 'ThumbUrl,PVs,MainPicture',
      this.lang = 'Default',
      this.nameMatchMode = 'Auto'})
      : _artistId = artistId,
        _tagId = tagId;

  factory _$_SongsListParams.fromJson(Map<String, dynamic> json) =>
      _$$_SongsListParamsFromJson(json);

  @override
  final String? query;
  @override
  final String? songTypes;
  @override
  @JsonKey()
  final String sort;
  final List<int>? _artistId;
  @override
  @JsonKey(name: 'artistId')
  List<int>? get artistId {
    final value = _artistId;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _tagId;
  @override
  @JsonKey(name: 'tagId[]')
  List<int>? get tagId {
    final value = _tagId;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int start;
  @override
  @JsonKey()
  final int maxResults;
  @override
  @JsonKey()
  final String fields;
  @override
  @JsonKey()
  final String lang;
  @override
  @JsonKey()
  final String nameMatchMode;

  @override
  String toString() {
    return 'SongsListParams(query: $query, songTypes: $songTypes, sort: $sort, artistId: $artistId, tagId: $tagId, start: $start, maxResults: $maxResults, fields: $fields, lang: $lang, nameMatchMode: $nameMatchMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SongsListParams &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.songTypes, songTypes) ||
                other.songTypes == songTypes) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            const DeepCollectionEquality().equals(other._artistId, _artistId) &&
            const DeepCollectionEquality().equals(other._tagId, _tagId) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.maxResults, maxResults) ||
                other.maxResults == maxResults) &&
            (identical(other.fields, fields) || other.fields == fields) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.nameMatchMode, nameMatchMode) ||
                other.nameMatchMode == nameMatchMode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      query,
      songTypes,
      sort,
      const DeepCollectionEquality().hash(_artistId),
      const DeepCollectionEquality().hash(_tagId),
      start,
      maxResults,
      fields,
      lang,
      nameMatchMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SongsListParamsCopyWith<_$_SongsListParams> get copyWith =>
      __$$_SongsListParamsCopyWithImpl<_$_SongsListParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SongsListParamsToJson(
      this,
    );
  }
}

abstract class _SongsListParams implements SongsListParams {
  const factory _SongsListParams(
      {final String? query,
      final String? songTypes,
      final String sort,
      @JsonKey(name: 'artistId') final List<int>? artistId,
      @JsonKey(name: 'tagId[]') final List<int>? tagId,
      final int start,
      final int maxResults,
      final String fields,
      final String lang,
      final String nameMatchMode}) = _$_SongsListParams;

  factory _SongsListParams.fromJson(Map<String, dynamic> json) =
      _$_SongsListParams.fromJson;

  @override
  String? get query;
  @override
  String? get songTypes;
  @override
  String get sort;
  @override
  @JsonKey(name: 'artistId')
  List<int>? get artistId;
  @override
  @JsonKey(name: 'tagId[]')
  List<int>? get tagId;
  @override
  int get start;
  @override
  int get maxResults;
  @override
  String get fields;
  @override
  String get lang;
  @override
  String get nameMatchMode;
  @override
  @JsonKey(ignore: true)
  _$$_SongsListParamsCopyWith<_$_SongsListParams> get copyWith =>
      throw _privateConstructorUsedError;
}
