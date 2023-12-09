// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'artist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Artist _$ArtistFromJson(Map<String, dynamic> json) {
  return _Artist.fromJson(json);
}

/// @nodoc
mixin _$Artist {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get additionalNames => throw _privateConstructorUsedError;
  String? get releaseDate => throw _privateConstructorUsedError;
  String? get artistType => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  MainPicture? get mainPicture => throw _privateConstructorUsedError;
  ArtistRelations? get relations => throw _privateConstructorUsedError;
  Artist? get baseVoicebank => throw _privateConstructorUsedError;
  List<TagUsage> get tags => throw _privateConstructorUsedError;
  List<WebLink> get webLinks => throw _privateConstructorUsedError;
  List<ArtistLink> get artistLinksReverse => throw _privateConstructorUsedError;
  List<ArtistLink> get artistLinks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtistCopyWith<Artist> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistCopyWith<$Res> {
  factory $ArtistCopyWith(Artist value, $Res Function(Artist) then) =
      _$ArtistCopyWithImpl<$Res, Artist>;
  @useResult
  $Res call(
      {int id,
      String? name,
      String? additionalNames,
      String? releaseDate,
      String? artistType,
      String? description,
      MainPicture? mainPicture,
      ArtistRelations? relations,
      Artist? baseVoicebank,
      List<TagUsage> tags,
      List<WebLink> webLinks,
      List<ArtistLink> artistLinksReverse,
      List<ArtistLink> artistLinks});

  $MainPictureCopyWith<$Res>? get mainPicture;
  $ArtistRelationsCopyWith<$Res>? get relations;
  $ArtistCopyWith<$Res>? get baseVoicebank;
}

/// @nodoc
class _$ArtistCopyWithImpl<$Res, $Val extends Artist>
    implements $ArtistCopyWith<$Res> {
  _$ArtistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? additionalNames = freezed,
    Object? releaseDate = freezed,
    Object? artistType = freezed,
    Object? description = freezed,
    Object? mainPicture = freezed,
    Object? relations = freezed,
    Object? baseVoicebank = freezed,
    Object? tags = null,
    Object? webLinks = null,
    Object? artistLinksReverse = null,
    Object? artistLinks = null,
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
      additionalNames: freezed == additionalNames
          ? _value.additionalNames
          : additionalNames // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      artistType: freezed == artistType
          ? _value.artistType
          : artistType // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      mainPicture: freezed == mainPicture
          ? _value.mainPicture
          : mainPicture // ignore: cast_nullable_to_non_nullable
              as MainPicture?,
      relations: freezed == relations
          ? _value.relations
          : relations // ignore: cast_nullable_to_non_nullable
              as ArtistRelations?,
      baseVoicebank: freezed == baseVoicebank
          ? _value.baseVoicebank
          : baseVoicebank // ignore: cast_nullable_to_non_nullable
              as Artist?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagUsage>,
      webLinks: null == webLinks
          ? _value.webLinks
          : webLinks // ignore: cast_nullable_to_non_nullable
              as List<WebLink>,
      artistLinksReverse: null == artistLinksReverse
          ? _value.artistLinksReverse
          : artistLinksReverse // ignore: cast_nullable_to_non_nullable
              as List<ArtistLink>,
      artistLinks: null == artistLinks
          ? _value.artistLinks
          : artistLinks // ignore: cast_nullable_to_non_nullable
              as List<ArtistLink>,
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
  $ArtistRelationsCopyWith<$Res>? get relations {
    if (_value.relations == null) {
      return null;
    }

    return $ArtistRelationsCopyWith<$Res>(_value.relations!, (value) {
      return _then(_value.copyWith(relations: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ArtistCopyWith<$Res>? get baseVoicebank {
    if (_value.baseVoicebank == null) {
      return null;
    }

    return $ArtistCopyWith<$Res>(_value.baseVoicebank!, (value) {
      return _then(_value.copyWith(baseVoicebank: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ArtistCopyWith<$Res> implements $ArtistCopyWith<$Res> {
  factory _$$_ArtistCopyWith(_$_Artist value, $Res Function(_$_Artist) then) =
      __$$_ArtistCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? name,
      String? additionalNames,
      String? releaseDate,
      String? artistType,
      String? description,
      MainPicture? mainPicture,
      ArtistRelations? relations,
      Artist? baseVoicebank,
      List<TagUsage> tags,
      List<WebLink> webLinks,
      List<ArtistLink> artistLinksReverse,
      List<ArtistLink> artistLinks});

  @override
  $MainPictureCopyWith<$Res>? get mainPicture;
  @override
  $ArtistRelationsCopyWith<$Res>? get relations;
  @override
  $ArtistCopyWith<$Res>? get baseVoicebank;
}

/// @nodoc
class __$$_ArtistCopyWithImpl<$Res>
    extends _$ArtistCopyWithImpl<$Res, _$_Artist>
    implements _$$_ArtistCopyWith<$Res> {
  __$$_ArtistCopyWithImpl(_$_Artist _value, $Res Function(_$_Artist) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? additionalNames = freezed,
    Object? releaseDate = freezed,
    Object? artistType = freezed,
    Object? description = freezed,
    Object? mainPicture = freezed,
    Object? relations = freezed,
    Object? baseVoicebank = freezed,
    Object? tags = null,
    Object? webLinks = null,
    Object? artistLinksReverse = null,
    Object? artistLinks = null,
  }) {
    return _then(_$_Artist(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalNames: freezed == additionalNames
          ? _value.additionalNames
          : additionalNames // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      artistType: freezed == artistType
          ? _value.artistType
          : artistType // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      mainPicture: freezed == mainPicture
          ? _value.mainPicture
          : mainPicture // ignore: cast_nullable_to_non_nullable
              as MainPicture?,
      relations: freezed == relations
          ? _value.relations
          : relations // ignore: cast_nullable_to_non_nullable
              as ArtistRelations?,
      baseVoicebank: freezed == baseVoicebank
          ? _value.baseVoicebank
          : baseVoicebank // ignore: cast_nullable_to_non_nullable
              as Artist?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagUsage>,
      webLinks: null == webLinks
          ? _value._webLinks
          : webLinks // ignore: cast_nullable_to_non_nullable
              as List<WebLink>,
      artistLinksReverse: null == artistLinksReverse
          ? _value._artistLinksReverse
          : artistLinksReverse // ignore: cast_nullable_to_non_nullable
              as List<ArtistLink>,
      artistLinks: null == artistLinks
          ? _value._artistLinks
          : artistLinks // ignore: cast_nullable_to_non_nullable
              as List<ArtistLink>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Artist implements _Artist {
  _$_Artist(
      {required this.id,
      this.name,
      this.additionalNames,
      this.releaseDate,
      this.artistType,
      this.description,
      this.mainPicture,
      this.relations,
      this.baseVoicebank,
      final List<TagUsage> tags = const [],
      final List<WebLink> webLinks = const [],
      final List<ArtistLink> artistLinksReverse = const [],
      final List<ArtistLink> artistLinks = const []})
      : _tags = tags,
        _webLinks = webLinks,
        _artistLinksReverse = artistLinksReverse,
        _artistLinks = artistLinks;

  factory _$_Artist.fromJson(Map<String, dynamic> json) =>
      _$$_ArtistFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final String? additionalNames;
  @override
  final String? releaseDate;
  @override
  final String? artistType;
  @override
  final String? description;
  @override
  final MainPicture? mainPicture;
  @override
  final ArtistRelations? relations;
  @override
  final Artist? baseVoicebank;
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

  final List<ArtistLink> _artistLinksReverse;
  @override
  @JsonKey()
  List<ArtistLink> get artistLinksReverse {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artistLinksReverse);
  }

  final List<ArtistLink> _artistLinks;
  @override
  @JsonKey()
  List<ArtistLink> get artistLinks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artistLinks);
  }

  @override
  String toString() {
    return 'Artist(id: $id, name: $name, additionalNames: $additionalNames, releaseDate: $releaseDate, artistType: $artistType, description: $description, mainPicture: $mainPicture, relations: $relations, baseVoicebank: $baseVoicebank, tags: $tags, webLinks: $webLinks, artistLinksReverse: $artistLinksReverse, artistLinks: $artistLinks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Artist &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.additionalNames, additionalNames) ||
                other.additionalNames == additionalNames) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.artistType, artistType) ||
                other.artistType == artistType) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.mainPicture, mainPicture) ||
                other.mainPicture == mainPicture) &&
            (identical(other.relations, relations) ||
                other.relations == relations) &&
            (identical(other.baseVoicebank, baseVoicebank) ||
                other.baseVoicebank == baseVoicebank) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._webLinks, _webLinks) &&
            const DeepCollectionEquality()
                .equals(other._artistLinksReverse, _artistLinksReverse) &&
            const DeepCollectionEquality()
                .equals(other._artistLinks, _artistLinks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      additionalNames,
      releaseDate,
      artistType,
      description,
      mainPicture,
      relations,
      baseVoicebank,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_webLinks),
      const DeepCollectionEquality().hash(_artistLinksReverse),
      const DeepCollectionEquality().hash(_artistLinks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArtistCopyWith<_$_Artist> get copyWith =>
      __$$_ArtistCopyWithImpl<_$_Artist>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArtistToJson(
      this,
    );
  }
}

abstract class _Artist implements Artist {
  factory _Artist(
      {required final int id,
      final String? name,
      final String? additionalNames,
      final String? releaseDate,
      final String? artistType,
      final String? description,
      final MainPicture? mainPicture,
      final ArtistRelations? relations,
      final Artist? baseVoicebank,
      final List<TagUsage> tags,
      final List<WebLink> webLinks,
      final List<ArtistLink> artistLinksReverse,
      final List<ArtistLink> artistLinks}) = _$_Artist;

  factory _Artist.fromJson(Map<String, dynamic> json) = _$_Artist.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  String? get additionalNames;
  @override
  String? get releaseDate;
  @override
  String? get artistType;
  @override
  String? get description;
  @override
  MainPicture? get mainPicture;
  @override
  ArtistRelations? get relations;
  @override
  Artist? get baseVoicebank;
  @override
  List<TagUsage> get tags;
  @override
  List<WebLink> get webLinks;
  @override
  List<ArtistLink> get artistLinksReverse;
  @override
  List<ArtistLink> get artistLinks;
  @override
  @JsonKey(ignore: true)
  _$$_ArtistCopyWith<_$_Artist> get copyWith =>
      throw _privateConstructorUsedError;
}
