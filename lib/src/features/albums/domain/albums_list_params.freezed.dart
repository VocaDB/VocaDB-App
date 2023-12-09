// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'albums_list_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AlbumsListParams _$AlbumsListParamsFromJson(Map<String, dynamic> json) {
  return _AlbumsListParams.fromJson(json);
}

/// @nodoc
mixin _$AlbumsListParams {
  String? get query => throw _privateConstructorUsedError;
  String? get discTypes => throw _privateConstructorUsedError;
  @JsonKey(name: 'tagId[]')
  List<int>? get tagId => throw _privateConstructorUsedError;
  int get start => throw _privateConstructorUsedError;
  int get maxResults => throw _privateConstructorUsedError;
  String get sort => throw _privateConstructorUsedError;
  String get nameMatchMode => throw _privateConstructorUsedError;
  String get fields => throw _privateConstructorUsedError;
  String get lang => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumsListParamsCopyWith<AlbumsListParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumsListParamsCopyWith<$Res> {
  factory $AlbumsListParamsCopyWith(
          AlbumsListParams value, $Res Function(AlbumsListParams) then) =
      _$AlbumsListParamsCopyWithImpl<$Res, AlbumsListParams>;
  @useResult
  $Res call(
      {String? query,
      String? discTypes,
      @JsonKey(name: 'tagId[]') List<int>? tagId,
      int start,
      int maxResults,
      String sort,
      String nameMatchMode,
      String fields,
      String lang});
}

/// @nodoc
class _$AlbumsListParamsCopyWithImpl<$Res, $Val extends AlbumsListParams>
    implements $AlbumsListParamsCopyWith<$Res> {
  _$AlbumsListParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
    Object? discTypes = freezed,
    Object? tagId = freezed,
    Object? start = null,
    Object? maxResults = null,
    Object? sort = null,
    Object? nameMatchMode = null,
    Object? fields = null,
    Object? lang = null,
  }) {
    return _then(_value.copyWith(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      discTypes: freezed == discTypes
          ? _value.discTypes
          : discTypes // ignore: cast_nullable_to_non_nullable
              as String?,
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
      sort: null == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String,
      nameMatchMode: null == nameMatchMode
          ? _value.nameMatchMode
          : nameMatchMode // ignore: cast_nullable_to_non_nullable
              as String,
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as String,
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AlbumsListParamsCopyWith<$Res>
    implements $AlbumsListParamsCopyWith<$Res> {
  factory _$$_AlbumsListParamsCopyWith(
          _$_AlbumsListParams value, $Res Function(_$_AlbumsListParams) then) =
      __$$_AlbumsListParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? query,
      String? discTypes,
      @JsonKey(name: 'tagId[]') List<int>? tagId,
      int start,
      int maxResults,
      String sort,
      String nameMatchMode,
      String fields,
      String lang});
}

/// @nodoc
class __$$_AlbumsListParamsCopyWithImpl<$Res>
    extends _$AlbumsListParamsCopyWithImpl<$Res, _$_AlbumsListParams>
    implements _$$_AlbumsListParamsCopyWith<$Res> {
  __$$_AlbumsListParamsCopyWithImpl(
      _$_AlbumsListParams _value, $Res Function(_$_AlbumsListParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
    Object? discTypes = freezed,
    Object? tagId = freezed,
    Object? start = null,
    Object? maxResults = null,
    Object? sort = null,
    Object? nameMatchMode = null,
    Object? fields = null,
    Object? lang = null,
  }) {
    return _then(_$_AlbumsListParams(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      discTypes: freezed == discTypes
          ? _value.discTypes
          : discTypes // ignore: cast_nullable_to_non_nullable
              as String?,
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
      sort: null == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String,
      nameMatchMode: null == nameMatchMode
          ? _value.nameMatchMode
          : nameMatchMode // ignore: cast_nullable_to_non_nullable
              as String,
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as String,
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_AlbumsListParams implements _AlbumsListParams {
  const _$_AlbumsListParams(
      {this.query,
      this.discTypes,
      @JsonKey(name: 'tagId[]') final List<int>? tagId,
      this.start = 0,
      this.maxResults = 10,
      this.sort = 'None',
      this.nameMatchMode = 'Auto',
      this.fields = 'MainPicture',
      this.lang = 'Default'})
      : _tagId = tagId;

  factory _$_AlbumsListParams.fromJson(Map<String, dynamic> json) =>
      _$$_AlbumsListParamsFromJson(json);

  @override
  final String? query;
  @override
  final String? discTypes;
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
  final String sort;
  @override
  @JsonKey()
  final String nameMatchMode;
  @override
  @JsonKey()
  final String fields;
  @override
  @JsonKey()
  final String lang;

  @override
  String toString() {
    return 'AlbumsListParams(query: $query, discTypes: $discTypes, tagId: $tagId, start: $start, maxResults: $maxResults, sort: $sort, nameMatchMode: $nameMatchMode, fields: $fields, lang: $lang)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AlbumsListParams &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.discTypes, discTypes) ||
                other.discTypes == discTypes) &&
            const DeepCollectionEquality().equals(other._tagId, _tagId) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.maxResults, maxResults) ||
                other.maxResults == maxResults) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.nameMatchMode, nameMatchMode) ||
                other.nameMatchMode == nameMatchMode) &&
            (identical(other.fields, fields) || other.fields == fields) &&
            (identical(other.lang, lang) || other.lang == lang));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      query,
      discTypes,
      const DeepCollectionEquality().hash(_tagId),
      start,
      maxResults,
      sort,
      nameMatchMode,
      fields,
      lang);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AlbumsListParamsCopyWith<_$_AlbumsListParams> get copyWith =>
      __$$_AlbumsListParamsCopyWithImpl<_$_AlbumsListParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AlbumsListParamsToJson(
      this,
    );
  }
}

abstract class _AlbumsListParams implements AlbumsListParams {
  const factory _AlbumsListParams(
      {final String? query,
      final String? discTypes,
      @JsonKey(name: 'tagId[]') final List<int>? tagId,
      final int start,
      final int maxResults,
      final String sort,
      final String nameMatchMode,
      final String fields,
      final String lang}) = _$_AlbumsListParams;

  factory _AlbumsListParams.fromJson(Map<String, dynamic> json) =
      _$_AlbumsListParams.fromJson;

  @override
  String? get query;
  @override
  String? get discTypes;
  @override
  @JsonKey(name: 'tagId[]')
  List<int>? get tagId;
  @override
  int get start;
  @override
  int get maxResults;
  @override
  String get sort;
  @override
  String get nameMatchMode;
  @override
  String get fields;
  @override
  String get lang;
  @override
  @JsonKey(ignore: true)
  _$$_AlbumsListParamsCopyWith<_$_AlbumsListParams> get copyWith =>
      throw _privateConstructorUsedError;
}
