// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Entry _$EntryFromJson(Map<String, dynamic> json) {
  return _Entry.fromJson(json);
}

/// @nodoc
mixin _$Entry {
  int get id => throw _privateConstructorUsedError;
  String get entryType => throw _privateConstructorUsedError;
  String? get additionalNames => throw _privateConstructorUsedError;
  String? get defaultName => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get artistString => throw _privateConstructorUsedError;
  String? get artistType => throw _privateConstructorUsedError;
  String? get songType => throw _privateConstructorUsedError;
  String? get discType => throw _privateConstructorUsedError;
  String? get eventCategory => throw _privateConstructorUsedError;
  String? get activityDate => throw _privateConstructorUsedError;
  MainPicture? get mainPicture => throw _privateConstructorUsedError;
  List<TagUsage> get tags => throw _privateConstructorUsedError;
  List<WebLink> get webLinks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EntryCopyWith<Entry> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntryCopyWith<$Res> {
  factory $EntryCopyWith(Entry value, $Res Function(Entry) then) =
      _$EntryCopyWithImpl<$Res, Entry>;
  @useResult
  $Res call(
      {int id,
      String entryType,
      String? additionalNames,
      String? defaultName,
      String? name,
      String? artistString,
      String? artistType,
      String? songType,
      String? discType,
      String? eventCategory,
      String? activityDate,
      MainPicture? mainPicture,
      List<TagUsage> tags,
      List<WebLink> webLinks});

  $MainPictureCopyWith<$Res>? get mainPicture;
}

/// @nodoc
class _$EntryCopyWithImpl<$Res, $Val extends Entry>
    implements $EntryCopyWith<$Res> {
  _$EntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? entryType = null,
    Object? additionalNames = freezed,
    Object? defaultName = freezed,
    Object? name = freezed,
    Object? artistString = freezed,
    Object? artistType = freezed,
    Object? songType = freezed,
    Object? discType = freezed,
    Object? eventCategory = freezed,
    Object? activityDate = freezed,
    Object? mainPicture = freezed,
    Object? tags = null,
    Object? webLinks = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      entryType: null == entryType
          ? _value.entryType
          : entryType // ignore: cast_nullable_to_non_nullable
              as String,
      additionalNames: freezed == additionalNames
          ? _value.additionalNames
          : additionalNames // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultName: freezed == defaultName
          ? _value.defaultName
          : defaultName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      artistString: freezed == artistString
          ? _value.artistString
          : artistString // ignore: cast_nullable_to_non_nullable
              as String?,
      artistType: freezed == artistType
          ? _value.artistType
          : artistType // ignore: cast_nullable_to_non_nullable
              as String?,
      songType: freezed == songType
          ? _value.songType
          : songType // ignore: cast_nullable_to_non_nullable
              as String?,
      discType: freezed == discType
          ? _value.discType
          : discType // ignore: cast_nullable_to_non_nullable
              as String?,
      eventCategory: freezed == eventCategory
          ? _value.eventCategory
          : eventCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      activityDate: freezed == activityDate
          ? _value.activityDate
          : activityDate // ignore: cast_nullable_to_non_nullable
              as String?,
      mainPicture: freezed == mainPicture
          ? _value.mainPicture
          : mainPicture // ignore: cast_nullable_to_non_nullable
              as MainPicture?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagUsage>,
      webLinks: null == webLinks
          ? _value.webLinks
          : webLinks // ignore: cast_nullable_to_non_nullable
              as List<WebLink>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MainPictureCopyWith<$Res>? get mainPicture {
    if (_value.mainPicture == null) {
      return null;
    }

    return $MainPictureCopyWith<$Res>(_value.mainPicture!, (value) {
      return _then(_value.copyWith(mainPicture: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EntryCopyWith<$Res> implements $EntryCopyWith<$Res> {
  factory _$$_EntryCopyWith(_$_Entry value, $Res Function(_$_Entry) then) =
      __$$_EntryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String entryType,
      String? additionalNames,
      String? defaultName,
      String? name,
      String? artistString,
      String? artistType,
      String? songType,
      String? discType,
      String? eventCategory,
      String? activityDate,
      MainPicture? mainPicture,
      List<TagUsage> tags,
      List<WebLink> webLinks});

  @override
  $MainPictureCopyWith<$Res>? get mainPicture;
}

/// @nodoc
class __$$_EntryCopyWithImpl<$Res> extends _$EntryCopyWithImpl<$Res, _$_Entry>
    implements _$$_EntryCopyWith<$Res> {
  __$$_EntryCopyWithImpl(_$_Entry _value, $Res Function(_$_Entry) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? entryType = null,
    Object? additionalNames = freezed,
    Object? defaultName = freezed,
    Object? name = freezed,
    Object? artistString = freezed,
    Object? artistType = freezed,
    Object? songType = freezed,
    Object? discType = freezed,
    Object? eventCategory = freezed,
    Object? activityDate = freezed,
    Object? mainPicture = freezed,
    Object? tags = null,
    Object? webLinks = null,
  }) {
    return _then(_$_Entry(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      entryType: null == entryType
          ? _value.entryType
          : entryType // ignore: cast_nullable_to_non_nullable
              as String,
      additionalNames: freezed == additionalNames
          ? _value.additionalNames
          : additionalNames // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultName: freezed == defaultName
          ? _value.defaultName
          : defaultName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      artistString: freezed == artistString
          ? _value.artistString
          : artistString // ignore: cast_nullable_to_non_nullable
              as String?,
      artistType: freezed == artistType
          ? _value.artistType
          : artistType // ignore: cast_nullable_to_non_nullable
              as String?,
      songType: freezed == songType
          ? _value.songType
          : songType // ignore: cast_nullable_to_non_nullable
              as String?,
      discType: freezed == discType
          ? _value.discType
          : discType // ignore: cast_nullable_to_non_nullable
              as String?,
      eventCategory: freezed == eventCategory
          ? _value.eventCategory
          : eventCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      activityDate: freezed == activityDate
          ? _value.activityDate
          : activityDate // ignore: cast_nullable_to_non_nullable
              as String?,
      mainPicture: freezed == mainPicture
          ? _value.mainPicture
          : mainPicture // ignore: cast_nullable_to_non_nullable
              as MainPicture?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagUsage>,
      webLinks: null == webLinks
          ? _value._webLinks
          : webLinks // ignore: cast_nullable_to_non_nullable
              as List<WebLink>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Entry implements _Entry {
  _$_Entry(
      {required this.id,
      required this.entryType,
      this.additionalNames,
      this.defaultName,
      this.name,
      this.artistString,
      this.artistType,
      this.songType,
      this.discType,
      this.eventCategory,
      this.activityDate,
      this.mainPicture,
      final List<TagUsage> tags = const [],
      final List<WebLink> webLinks = const []})
      : _tags = tags,
        _webLinks = webLinks;

  factory _$_Entry.fromJson(Map<String, dynamic> json) =>
      _$$_EntryFromJson(json);

  @override
  final int id;
  @override
  final String entryType;
  @override
  final String? additionalNames;
  @override
  final String? defaultName;
  @override
  final String? name;
  @override
  final String? artistString;
  @override
  final String? artistType;
  @override
  final String? songType;
  @override
  final String? discType;
  @override
  final String? eventCategory;
  @override
  final String? activityDate;
  @override
  final MainPicture? mainPicture;
  final List<TagUsage> _tags;
  @override
  @JsonKey()
  List<TagUsage> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<WebLink> _webLinks;
  @override
  @JsonKey()
  List<WebLink> get webLinks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_webLinks);
  }

  @override
  String toString() {
    return 'Entry(id: $id, entryType: $entryType, additionalNames: $additionalNames, defaultName: $defaultName, name: $name, artistString: $artistString, artistType: $artistType, songType: $songType, discType: $discType, eventCategory: $eventCategory, activityDate: $activityDate, mainPicture: $mainPicture, tags: $tags, webLinks: $webLinks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Entry &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.entryType, entryType) ||
                other.entryType == entryType) &&
            (identical(other.additionalNames, additionalNames) ||
                other.additionalNames == additionalNames) &&
            (identical(other.defaultName, defaultName) ||
                other.defaultName == defaultName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.artistString, artistString) ||
                other.artistString == artistString) &&
            (identical(other.artistType, artistType) ||
                other.artistType == artistType) &&
            (identical(other.songType, songType) ||
                other.songType == songType) &&
            (identical(other.discType, discType) ||
                other.discType == discType) &&
            (identical(other.eventCategory, eventCategory) ||
                other.eventCategory == eventCategory) &&
            (identical(other.activityDate, activityDate) ||
                other.activityDate == activityDate) &&
            (identical(other.mainPicture, mainPicture) ||
                other.mainPicture == mainPicture) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._webLinks, _webLinks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      entryType,
      additionalNames,
      defaultName,
      name,
      artistString,
      artistType,
      songType,
      discType,
      eventCategory,
      activityDate,
      mainPicture,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_webLinks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EntryCopyWith<_$_Entry> get copyWith =>
      __$$_EntryCopyWithImpl<_$_Entry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EntryToJson(
      this,
    );
  }
}

abstract class _Entry implements Entry {
  factory _Entry(
      {required final int id,
      required final String entryType,
      final String? additionalNames,
      final String? defaultName,
      final String? name,
      final String? artistString,
      final String? artistType,
      final String? songType,
      final String? discType,
      final String? eventCategory,
      final String? activityDate,
      final MainPicture? mainPicture,
      final List<TagUsage> tags,
      final List<WebLink> webLinks}) = _$_Entry;

  factory _Entry.fromJson(Map<String, dynamic> json) = _$_Entry.fromJson;

  @override
  int get id;
  @override
  String get entryType;
  @override
  String? get additionalNames;
  @override
  String? get defaultName;
  @override
  String? get name;
  @override
  String? get artistString;
  @override
  String? get artistType;
  @override
  String? get songType;
  @override
  String? get discType;
  @override
  String? get eventCategory;
  @override
  String? get activityDate;
  @override
  MainPicture? get mainPicture;
  @override
  List<TagUsage> get tags;
  @override
  List<WebLink> get webLinks;
  @override
  @JsonKey(ignore: true)
  _$$_EntryCopyWith<_$_Entry> get copyWith =>
      throw _privateConstructorUsedError;
}
