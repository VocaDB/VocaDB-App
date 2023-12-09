// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'album.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Album _$AlbumFromJson(Map<String, dynamic> json) {
  return _Album.fromJson(json);
}

/// @nodoc
mixin _$Album {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get artistString => throw _privateConstructorUsedError;
  String? get discType => throw _privateConstructorUsedError;
  String? get catalogNumber => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<Disc> get discs => throw _privateConstructorUsedError;
  MainPicture? get mainPicture => throw _privateConstructorUsedError;
  List<ArtistRole> get artists => throw _privateConstructorUsedError;
  List<PV> get pvs => throw _privateConstructorUsedError;
  double get ratingAverage => throw _privateConstructorUsedError;
  int get ratingCount => throw _privateConstructorUsedError;
  ReleaseDate? get releaseDate => throw _privateConstructorUsedError;
  List<TagUsage> get tags => throw _privateConstructorUsedError;
  List<Track> get tracks => throw _privateConstructorUsedError;
  List<WebLink> get webLinks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumCopyWith<Album> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumCopyWith<$Res> {
  factory $AlbumCopyWith(Album value, $Res Function(Album) then) =
      _$AlbumCopyWithImpl<$Res, Album>;
  @useResult
  $Res call(
      {int id,
      String? name,
      String? artistString,
      String? discType,
      String? catalogNumber,
      String? description,
      List<Disc> discs,
      MainPicture? mainPicture,
      List<ArtistRole> artists,
      List<PV> pvs,
      double ratingAverage,
      int ratingCount,
      ReleaseDate? releaseDate,
      List<TagUsage> tags,
      List<Track> tracks,
      List<WebLink> webLinks});

  $MainPictureCopyWith<$Res>? get mainPicture;
  $ReleaseDateCopyWith<$Res>? get releaseDate;
}

/// @nodoc
class _$AlbumCopyWithImpl<$Res, $Val extends Album>
    implements $AlbumCopyWith<$Res> {
  _$AlbumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? artistString = freezed,
    Object? discType = freezed,
    Object? catalogNumber = freezed,
    Object? description = freezed,
    Object? discs = null,
    Object? mainPicture = freezed,
    Object? artists = null,
    Object? pvs = null,
    Object? ratingAverage = null,
    Object? ratingCount = null,
    Object? releaseDate = freezed,
    Object? tags = null,
    Object? tracks = null,
    Object? webLinks = null,
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
      artistString: freezed == artistString
          ? _value.artistString
          : artistString // ignore: cast_nullable_to_non_nullable
              as String?,
      discType: freezed == discType
          ? _value.discType
          : discType // ignore: cast_nullable_to_non_nullable
              as String?,
      catalogNumber: freezed == catalogNumber
          ? _value.catalogNumber
          : catalogNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      discs: null == discs
          ? _value.discs
          : discs // ignore: cast_nullable_to_non_nullable
              as List<Disc>,
      mainPicture: freezed == mainPicture
          ? _value.mainPicture
          : mainPicture // ignore: cast_nullable_to_non_nullable
              as MainPicture?,
      artists: null == artists
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<ArtistRole>,
      pvs: null == pvs
          ? _value.pvs
          : pvs // ignore: cast_nullable_to_non_nullable
              as List<PV>,
      ratingAverage: null == ratingAverage
          ? _value.ratingAverage
          : ratingAverage // ignore: cast_nullable_to_non_nullable
              as double,
      ratingCount: null == ratingCount
          ? _value.ratingCount
          : ratingCount // ignore: cast_nullable_to_non_nullable
              as int,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as ReleaseDate?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagUsage>,
      tracks: null == tracks
          ? _value.tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<Track>,
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

  @override
  @pragma('vm:prefer-inline')
  $ReleaseDateCopyWith<$Res>? get releaseDate {
    if (_value.releaseDate == null) {
      return null;
    }

    return $ReleaseDateCopyWith<$Res>(_value.releaseDate!, (value) {
      return _then(_value.copyWith(releaseDate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AlbumCopyWith<$Res> implements $AlbumCopyWith<$Res> {
  factory _$$_AlbumCopyWith(_$_Album value, $Res Function(_$_Album) then) =
      __$$_AlbumCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? name,
      String? artistString,
      String? discType,
      String? catalogNumber,
      String? description,
      List<Disc> discs,
      MainPicture? mainPicture,
      List<ArtistRole> artists,
      List<PV> pvs,
      double ratingAverage,
      int ratingCount,
      ReleaseDate? releaseDate,
      List<TagUsage> tags,
      List<Track> tracks,
      List<WebLink> webLinks});

  @override
  $MainPictureCopyWith<$Res>? get mainPicture;
  @override
  $ReleaseDateCopyWith<$Res>? get releaseDate;
}

/// @nodoc
class __$$_AlbumCopyWithImpl<$Res> extends _$AlbumCopyWithImpl<$Res, _$_Album>
    implements _$$_AlbumCopyWith<$Res> {
  __$$_AlbumCopyWithImpl(_$_Album _value, $Res Function(_$_Album) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? artistString = freezed,
    Object? discType = freezed,
    Object? catalogNumber = freezed,
    Object? description = freezed,
    Object? discs = null,
    Object? mainPicture = freezed,
    Object? artists = null,
    Object? pvs = null,
    Object? ratingAverage = null,
    Object? ratingCount = null,
    Object? releaseDate = freezed,
    Object? tags = null,
    Object? tracks = null,
    Object? webLinks = null,
  }) {
    return _then(_$_Album(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      artistString: freezed == artistString
          ? _value.artistString
          : artistString // ignore: cast_nullable_to_non_nullable
              as String?,
      discType: freezed == discType
          ? _value.discType
          : discType // ignore: cast_nullable_to_non_nullable
              as String?,
      catalogNumber: freezed == catalogNumber
          ? _value.catalogNumber
          : catalogNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      discs: null == discs
          ? _value._discs
          : discs // ignore: cast_nullable_to_non_nullable
              as List<Disc>,
      mainPicture: freezed == mainPicture
          ? _value.mainPicture
          : mainPicture // ignore: cast_nullable_to_non_nullable
              as MainPicture?,
      artists: null == artists
          ? _value._artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<ArtistRole>,
      pvs: null == pvs
          ? _value._pvs
          : pvs // ignore: cast_nullable_to_non_nullable
              as List<PV>,
      ratingAverage: null == ratingAverage
          ? _value.ratingAverage
          : ratingAverage // ignore: cast_nullable_to_non_nullable
              as double,
      ratingCount: null == ratingCount
          ? _value.ratingCount
          : ratingCount // ignore: cast_nullable_to_non_nullable
              as int,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as ReleaseDate?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagUsage>,
      tracks: null == tracks
          ? _value._tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<Track>,
      webLinks: null == webLinks
          ? _value._webLinks
          : webLinks // ignore: cast_nullable_to_non_nullable
              as List<WebLink>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Album implements _Album {
  _$_Album(
      {required this.id,
      this.name,
      this.artistString,
      this.discType,
      this.catalogNumber,
      this.description,
      final List<Disc> discs = const [],
      this.mainPicture,
      final List<ArtistRole> artists = const [],
      final List<PV> pvs = const [],
      this.ratingAverage = 0.00,
      this.ratingCount = 0,
      this.releaseDate,
      final List<TagUsage> tags = const [],
      final List<Track> tracks = const [],
      final List<WebLink> webLinks = const []})
      : _discs = discs,
        _artists = artists,
        _pvs = pvs,
        _tags = tags,
        _tracks = tracks,
        _webLinks = webLinks;

  factory _$_Album.fromJson(Map<String, dynamic> json) =>
      _$$_AlbumFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final String? artistString;
  @override
  final String? discType;
  @override
  final String? catalogNumber;
  @override
  final String? description;
  final List<Disc> _discs;
  @override
  @JsonKey()
  List<Disc> get discs {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_discs);
  }

  @override
  final MainPicture? mainPicture;
  final List<ArtistRole> _artists;
  @override
  @JsonKey()
  List<ArtistRole> get artists {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artists);
  }

  final List<PV> _pvs;
  @override
  @JsonKey()
  List<PV> get pvs {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pvs);
  }

  @override
  @JsonKey()
  final double ratingAverage;
  @override
  @JsonKey()
  final int ratingCount;
  @override
  final ReleaseDate? releaseDate;
  final List<TagUsage> _tags;
  @override
  @JsonKey()
  List<TagUsage> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<Track> _tracks;
  @override
  @JsonKey()
  List<Track> get tracks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tracks);
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
    return 'Album(id: $id, name: $name, artistString: $artistString, discType: $discType, catalogNumber: $catalogNumber, description: $description, discs: $discs, mainPicture: $mainPicture, artists: $artists, pvs: $pvs, ratingAverage: $ratingAverage, ratingCount: $ratingCount, releaseDate: $releaseDate, tags: $tags, tracks: $tracks, webLinks: $webLinks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Album &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.artistString, artistString) ||
                other.artistString == artistString) &&
            (identical(other.discType, discType) ||
                other.discType == discType) &&
            (identical(other.catalogNumber, catalogNumber) ||
                other.catalogNumber == catalogNumber) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._discs, _discs) &&
            (identical(other.mainPicture, mainPicture) ||
                other.mainPicture == mainPicture) &&
            const DeepCollectionEquality().equals(other._artists, _artists) &&
            const DeepCollectionEquality().equals(other._pvs, _pvs) &&
            (identical(other.ratingAverage, ratingAverage) ||
                other.ratingAverage == ratingAverage) &&
            (identical(other.ratingCount, ratingCount) ||
                other.ratingCount == ratingCount) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._tracks, _tracks) &&
            const DeepCollectionEquality().equals(other._webLinks, _webLinks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      artistString,
      discType,
      catalogNumber,
      description,
      const DeepCollectionEquality().hash(_discs),
      mainPicture,
      const DeepCollectionEquality().hash(_artists),
      const DeepCollectionEquality().hash(_pvs),
      ratingAverage,
      ratingCount,
      releaseDate,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_tracks),
      const DeepCollectionEquality().hash(_webLinks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AlbumCopyWith<_$_Album> get copyWith =>
      __$$_AlbumCopyWithImpl<_$_Album>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AlbumToJson(
      this,
    );
  }
}

abstract class _Album implements Album {
  factory _Album(
      {required final int id,
      final String? name,
      final String? artistString,
      final String? discType,
      final String? catalogNumber,
      final String? description,
      final List<Disc> discs,
      final MainPicture? mainPicture,
      final List<ArtistRole> artists,
      final List<PV> pvs,
      final double ratingAverage,
      final int ratingCount,
      final ReleaseDate? releaseDate,
      final List<TagUsage> tags,
      final List<Track> tracks,
      final List<WebLink> webLinks}) = _$_Album;

  factory _Album.fromJson(Map<String, dynamic> json) = _$_Album.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  String? get artistString;
  @override
  String? get discType;
  @override
  String? get catalogNumber;
  @override
  String? get description;
  @override
  List<Disc> get discs;
  @override
  MainPicture? get mainPicture;
  @override
  List<ArtistRole> get artists;
  @override
  List<PV> get pvs;
  @override
  double get ratingAverage;
  @override
  int get ratingCount;
  @override
  ReleaseDate? get releaseDate;
  @override
  List<TagUsage> get tags;
  @override
  List<Track> get tracks;
  @override
  List<WebLink> get webLinks;
  @override
  @JsonKey(ignore: true)
  _$$_AlbumCopyWith<_$_Album> get copyWith =>
      throw _privateConstructorUsedError;
}
