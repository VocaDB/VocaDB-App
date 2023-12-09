// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tag _$TagFromJson(Map<String, dynamic> json) {
  return _Tag.fromJson(json);
}

/// @nodoc
mixin _$Tag {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get categoryName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  MainPicture? get mainPicture => throw _privateConstructorUsedError;
  Tag? get parent => throw _privateConstructorUsedError;
  List<Tag> get relatedTags => throw _privateConstructorUsedError;
  int get usageCount => throw _privateConstructorUsedError;
  List<WebLink> get webLinks => throw _privateConstructorUsedError;
  String? get additionalNames => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagCopyWith<Tag> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagCopyWith<$Res> {
  factory $TagCopyWith(Tag value, $Res Function(Tag) then) =
      _$TagCopyWithImpl<$Res, Tag>;
  @useResult
  $Res call(
      {int id,
      String? name,
      String? categoryName,
      String? description,
      MainPicture? mainPicture,
      Tag? parent,
      List<Tag> relatedTags,
      int usageCount,
      List<WebLink> webLinks,
      String? additionalNames});

  $MainPictureCopyWith<$Res>? get mainPicture;
  $TagCopyWith<$Res>? get parent;
}

/// @nodoc
class _$TagCopyWithImpl<$Res, $Val extends Tag> implements $TagCopyWith<$Res> {
  _$TagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? categoryName = freezed,
    Object? description = freezed,
    Object? mainPicture = freezed,
    Object? parent = freezed,
    Object? relatedTags = null,
    Object? usageCount = null,
    Object? webLinks = null,
    Object? additionalNames = freezed,
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
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      mainPicture: freezed == mainPicture
          ? _value.mainPicture
          : mainPicture // ignore: cast_nullable_to_non_nullable
              as MainPicture?,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as Tag?,
      relatedTags: null == relatedTags
          ? _value.relatedTags
          : relatedTags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      usageCount: null == usageCount
          ? _value.usageCount
          : usageCount // ignore: cast_nullable_to_non_nullable
              as int,
      webLinks: null == webLinks
          ? _value.webLinks
          : webLinks // ignore: cast_nullable_to_non_nullable
              as List<WebLink>,
      additionalNames: freezed == additionalNames
          ? _value.additionalNames
          : additionalNames // ignore: cast_nullable_to_non_nullable
              as String?,
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

  @override
  @pragma('vm:prefer-inline')
  $TagCopyWith<$Res>? get parent {
    if (_value.parent == null) {
      return null;
    }

    return $TagCopyWith<$Res>(_value.parent!, (value) {
      return _then(_value.copyWith(parent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TagCopyWith<$Res> implements $TagCopyWith<$Res> {
  factory _$$_TagCopyWith(_$_Tag value, $Res Function(_$_Tag) then) =
      __$$_TagCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? name,
      String? categoryName,
      String? description,
      MainPicture? mainPicture,
      Tag? parent,
      List<Tag> relatedTags,
      int usageCount,
      List<WebLink> webLinks,
      String? additionalNames});

  @override
  $MainPictureCopyWith<$Res>? get mainPicture;
  @override
  $TagCopyWith<$Res>? get parent;
}

/// @nodoc
class __$$_TagCopyWithImpl<$Res> extends _$TagCopyWithImpl<$Res, _$_Tag>
    implements _$$_TagCopyWith<$Res> {
  __$$_TagCopyWithImpl(_$_Tag _value, $Res Function(_$_Tag) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? categoryName = freezed,
    Object? description = freezed,
    Object? mainPicture = freezed,
    Object? parent = freezed,
    Object? relatedTags = null,
    Object? usageCount = null,
    Object? webLinks = null,
    Object? additionalNames = freezed,
  }) {
    return _then(_$_Tag(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      mainPicture: freezed == mainPicture
          ? _value.mainPicture
          : mainPicture // ignore: cast_nullable_to_non_nullable
              as MainPicture?,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as Tag?,
      relatedTags: null == relatedTags
          ? _value._relatedTags
          : relatedTags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      usageCount: null == usageCount
          ? _value.usageCount
          : usageCount // ignore: cast_nullable_to_non_nullable
              as int,
      webLinks: null == webLinks
          ? _value._webLinks
          : webLinks // ignore: cast_nullable_to_non_nullable
              as List<WebLink>,
      additionalNames: freezed == additionalNames
          ? _value.additionalNames
          : additionalNames // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Tag implements _Tag {
  _$_Tag(
      {required this.id,
      this.name,
      this.categoryName,
      this.description,
      this.mainPicture,
      this.parent,
      final List<Tag> relatedTags = const [],
      this.usageCount = 0,
      final List<WebLink> webLinks = const [],
      this.additionalNames})
      : _relatedTags = relatedTags,
        _webLinks = webLinks;

  factory _$_Tag.fromJson(Map<String, dynamic> json) => _$$_TagFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final String? categoryName;
  @override
  final String? description;
  @override
  final MainPicture? mainPicture;
  @override
  final Tag? parent;
  final List<Tag> _relatedTags;
  @override
  @JsonKey()
  List<Tag> get relatedTags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relatedTags);
  }

  @override
  @JsonKey()
  final int usageCount;
  final List<WebLink> _webLinks;
  @override
  @JsonKey()
  List<WebLink> get webLinks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_webLinks);
  }

  @override
  final String? additionalNames;

  @override
  String toString() {
    return 'Tag(id: $id, name: $name, categoryName: $categoryName, description: $description, mainPicture: $mainPicture, parent: $parent, relatedTags: $relatedTags, usageCount: $usageCount, webLinks: $webLinks, additionalNames: $additionalNames)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tag &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.mainPicture, mainPicture) ||
                other.mainPicture == mainPicture) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            const DeepCollectionEquality()
                .equals(other._relatedTags, _relatedTags) &&
            (identical(other.usageCount, usageCount) ||
                other.usageCount == usageCount) &&
            const DeepCollectionEquality().equals(other._webLinks, _webLinks) &&
            (identical(other.additionalNames, additionalNames) ||
                other.additionalNames == additionalNames));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      categoryName,
      description,
      mainPicture,
      parent,
      const DeepCollectionEquality().hash(_relatedTags),
      usageCount,
      const DeepCollectionEquality().hash(_webLinks),
      additionalNames);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TagCopyWith<_$_Tag> get copyWith =>
      __$$_TagCopyWithImpl<_$_Tag>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TagToJson(
      this,
    );
  }
}

abstract class _Tag implements Tag {
  factory _Tag(
      {required final int id,
      final String? name,
      final String? categoryName,
      final String? description,
      final MainPicture? mainPicture,
      final Tag? parent,
      final List<Tag> relatedTags,
      final int usageCount,
      final List<WebLink> webLinks,
      final String? additionalNames}) = _$_Tag;

  factory _Tag.fromJson(Map<String, dynamic> json) = _$_Tag.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  String? get categoryName;
  @override
  String? get description;
  @override
  MainPicture? get mainPicture;
  @override
  Tag? get parent;
  @override
  List<Tag> get relatedTags;
  @override
  int get usageCount;
  @override
  List<WebLink> get webLinks;
  @override
  String? get additionalNames;
  @override
  @JsonKey(ignore: true)
  _$$_TagCopyWith<_$_Tag> get copyWith => throw _privateConstructorUsedError;
}
