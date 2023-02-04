// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_albums_list_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserAlbumsListParams _$UserAlbumsListParamsFromJson(Map<String, dynamic> json) {
  return _UserAlbumsListParams.fromJson(json);
}

/// @nodoc
mixin _$UserAlbumsListParams {
  String? get query => throw _privateConstructorUsedError;
  @JsonKey(name: 'tagId[]')
  List<int>? get tagId => throw _privateConstructorUsedError;
  @JsonKey(name: 'artistId[]')
  List<int>? get artistId => throw _privateConstructorUsedError;
  int get start => throw _privateConstructorUsedError;
  int get maxResults => throw _privateConstructorUsedError;
  String get purchaseStatuses => throw _privateConstructorUsedError;
  String get albumTypes => throw _privateConstructorUsedError;
  String get sort => throw _privateConstructorUsedError;
  String get fields => throw _privateConstructorUsedError;
  String get lang => throw _privateConstructorUsedError;
  String get nameMatchMode => throw _privateConstructorUsedError;
  String? get mediaType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAlbumsListParamsCopyWith<UserAlbumsListParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAlbumsListParamsCopyWith<$Res> {
  factory $UserAlbumsListParamsCopyWith(UserAlbumsListParams value,
          $Res Function(UserAlbumsListParams) then) =
      _$UserAlbumsListParamsCopyWithImpl<$Res, UserAlbumsListParams>;
  @useResult
  $Res call(
      {String? query,
      @JsonKey(name: 'tagId[]') List<int>? tagId,
      @JsonKey(name: 'artistId[]') List<int>? artistId,
      int start,
      int maxResults,
      String purchaseStatuses,
      String albumTypes,
      String sort,
      String fields,
      String lang,
      String nameMatchMode,
      String? mediaType});
}

/// @nodoc
class _$UserAlbumsListParamsCopyWithImpl<$Res,
        $Val extends UserAlbumsListParams>
    implements $UserAlbumsListParamsCopyWith<$Res> {
  _$UserAlbumsListParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
    Object? tagId = freezed,
    Object? artistId = freezed,
    Object? start = null,
    Object? maxResults = null,
    Object? purchaseStatuses = null,
    Object? albumTypes = null,
    Object? sort = null,
    Object? fields = null,
    Object? lang = null,
    Object? nameMatchMode = null,
    Object? mediaType = freezed,
  }) {
    return _then(_value.copyWith(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      tagId: freezed == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      artistId: freezed == artistId
          ? _value.artistId
          : artistId // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      maxResults: null == maxResults
          ? _value.maxResults
          : maxResults // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseStatuses: null == purchaseStatuses
          ? _value.purchaseStatuses
          : purchaseStatuses // ignore: cast_nullable_to_non_nullable
              as String,
      albumTypes: null == albumTypes
          ? _value.albumTypes
          : albumTypes // ignore: cast_nullable_to_non_nullable
              as String,
      sort: null == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String,
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
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserAlbumsListParamsCopyWith<$Res>
    implements $UserAlbumsListParamsCopyWith<$Res> {
  factory _$$_UserAlbumsListParamsCopyWith(_$_UserAlbumsListParams value,
          $Res Function(_$_UserAlbumsListParams) then) =
      __$$_UserAlbumsListParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? query,
      @JsonKey(name: 'tagId[]') List<int>? tagId,
      @JsonKey(name: 'artistId[]') List<int>? artistId,
      int start,
      int maxResults,
      String purchaseStatuses,
      String albumTypes,
      String sort,
      String fields,
      String lang,
      String nameMatchMode,
      String? mediaType});
}

/// @nodoc
class __$$_UserAlbumsListParamsCopyWithImpl<$Res>
    extends _$UserAlbumsListParamsCopyWithImpl<$Res, _$_UserAlbumsListParams>
    implements _$$_UserAlbumsListParamsCopyWith<$Res> {
  __$$_UserAlbumsListParamsCopyWithImpl(_$_UserAlbumsListParams _value,
      $Res Function(_$_UserAlbumsListParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
    Object? tagId = freezed,
    Object? artistId = freezed,
    Object? start = null,
    Object? maxResults = null,
    Object? purchaseStatuses = null,
    Object? albumTypes = null,
    Object? sort = null,
    Object? fields = null,
    Object? lang = null,
    Object? nameMatchMode = null,
    Object? mediaType = freezed,
  }) {
    return _then(_$_UserAlbumsListParams(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      tagId: freezed == tagId
          ? _value._tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      artistId: freezed == artistId
          ? _value._artistId
          : artistId // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      maxResults: null == maxResults
          ? _value.maxResults
          : maxResults // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseStatuses: null == purchaseStatuses
          ? _value.purchaseStatuses
          : purchaseStatuses // ignore: cast_nullable_to_non_nullable
              as String,
      albumTypes: null == albumTypes
          ? _value.albumTypes
          : albumTypes // ignore: cast_nullable_to_non_nullable
              as String,
      sort: null == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String,
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
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_UserAlbumsListParams implements _UserAlbumsListParams {
  const _$_UserAlbumsListParams(
      {this.query,
      @JsonKey(name: 'tagId[]') final List<int>? tagId,
      @JsonKey(name: 'artistId[]') final List<int>? artistId,
      this.start = 0,
      this.maxResults = 10,
      this.purchaseStatuses = 'All',
      this.albumTypes = 'Unknown',
      this.sort = 'Name',
      this.fields = 'MainPicture',
      this.lang = 'Default',
      this.nameMatchMode = 'Auto',
      this.mediaType})
      : _tagId = tagId,
        _artistId = artistId;

  factory _$_UserAlbumsListParams.fromJson(Map<String, dynamic> json) =>
      _$$_UserAlbumsListParamsFromJson(json);

  @override
  final String? query;
  final List<int>? _tagId;
  @override
  @JsonKey(name: 'tagId[]')
  List<int>? get tagId {
    final value = _tagId;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _artistId;
  @override
  @JsonKey(name: 'artistId[]')
  List<int>? get artistId {
    final value = _artistId;
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
  final String purchaseStatuses;
  @override
  @JsonKey()
  final String albumTypes;
  @override
  @JsonKey()
  final String sort;
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
  final String? mediaType;

  @override
  String toString() {
    return 'UserAlbumsListParams(query: $query, tagId: $tagId, artistId: $artistId, start: $start, maxResults: $maxResults, purchaseStatuses: $purchaseStatuses, albumTypes: $albumTypes, sort: $sort, fields: $fields, lang: $lang, nameMatchMode: $nameMatchMode, mediaType: $mediaType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserAlbumsListParams &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality().equals(other._tagId, _tagId) &&
            const DeepCollectionEquality().equals(other._artistId, _artistId) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.maxResults, maxResults) ||
                other.maxResults == maxResults) &&
            (identical(other.purchaseStatuses, purchaseStatuses) ||
                other.purchaseStatuses == purchaseStatuses) &&
            (identical(other.albumTypes, albumTypes) ||
                other.albumTypes == albumTypes) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.fields, fields) || other.fields == fields) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.nameMatchMode, nameMatchMode) ||
                other.nameMatchMode == nameMatchMode) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      query,
      const DeepCollectionEquality().hash(_tagId),
      const DeepCollectionEquality().hash(_artistId),
      start,
      maxResults,
      purchaseStatuses,
      albumTypes,
      sort,
      fields,
      lang,
      nameMatchMode,
      mediaType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserAlbumsListParamsCopyWith<_$_UserAlbumsListParams> get copyWith =>
      __$$_UserAlbumsListParamsCopyWithImpl<_$_UserAlbumsListParams>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserAlbumsListParamsToJson(
      this,
    );
  }
}

abstract class _UserAlbumsListParams implements UserAlbumsListParams {
  const factory _UserAlbumsListParams(
      {final String? query,
      @JsonKey(name: 'tagId[]') final List<int>? tagId,
      @JsonKey(name: 'artistId[]') final List<int>? artistId,
      final int start,
      final int maxResults,
      final String purchaseStatuses,
      final String albumTypes,
      final String sort,
      final String fields,
      final String lang,
      final String nameMatchMode,
      final String? mediaType}) = _$_UserAlbumsListParams;

  factory _UserAlbumsListParams.fromJson(Map<String, dynamic> json) =
      _$_UserAlbumsListParams.fromJson;

  @override
  String? get query;
  @override
  @JsonKey(name: 'tagId[]')
  List<int>? get tagId;
  @override
  @JsonKey(name: 'artistId[]')
  List<int>? get artistId;
  @override
  int get start;
  @override
  int get maxResults;
  @override
  String get purchaseStatuses;
  @override
  String get albumTypes;
  @override
  String get sort;
  @override
  String get fields;
  @override
  String get lang;
  @override
  String get nameMatchMode;
  @override
  String? get mediaType;
  @override
  @JsonKey(ignore: true)
  _$$_UserAlbumsListParamsCopyWith<_$_UserAlbumsListParams> get copyWith =>
      throw _privateConstructorUsedError;
}
