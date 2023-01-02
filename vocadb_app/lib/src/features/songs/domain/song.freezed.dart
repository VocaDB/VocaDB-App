// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'song.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Song _$SongFromJson(Map<String, dynamic> json) {
  return _Song.fromJson(json);
}

/// @nodoc
mixin _$Song {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get artistString => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get songType => throw _privateConstructorUsedError;
  String? get pvServices => throw _privateConstructorUsedError;
  String? get additionalNames => throw _privateConstructorUsedError;
  DateTime? get createDate => throw _privateConstructorUsedError;
  MainPicture? get mainPicture => throw _privateConstructorUsedError;
  int get favoritedTimes => throw _privateConstructorUsedError;
  int get lengthSeconds => throw _privateConstructorUsedError;
  DateTime? get publishDate => throw _privateConstructorUsedError;
  int get ratingScore => throw _privateConstructorUsedError;
  List<TagUsage> get tags => throw _privateConstructorUsedError;
  List<ArtistRole> get artists => throw _privateConstructorUsedError;
  List<Album> get albums => throw _privateConstructorUsedError;
  List<Lyric> get lyrics => throw _privateConstructorUsedError;
  List<PV> get pvs => throw _privateConstructorUsedError;
  List<WebLink> get webLinks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SongCopyWith<Song> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongCopyWith<$Res> {
  factory $SongCopyWith(Song value, $Res Function(Song) then) =
      _$SongCopyWithImpl<$Res, Song>;
  @useResult
  $Res call(
      {int id,
      String? name,
      String? artistString,
      String? imageUrl,
      String? songType,
      String? pvServices,
      String? additionalNames,
      DateTime? createDate,
      MainPicture? mainPicture,
      int favoritedTimes,
      int lengthSeconds,
      DateTime? publishDate,
      int ratingScore,
      List<TagUsage> tags,
      List<ArtistRole> artists,
      List<Album> albums,
      List<Lyric> lyrics,
      List<PV> pvs,
      List<WebLink> webLinks});

  $MainPictureCopyWith<$Res>? get mainPicture;
}

/// @nodoc
class _$SongCopyWithImpl<$Res, $Val extends Song>
    implements $SongCopyWith<$Res> {
  _$SongCopyWithImpl(this._value, this._then);

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
    Object? imageUrl = freezed,
    Object? songType = freezed,
    Object? pvServices = freezed,
    Object? additionalNames = freezed,
    Object? createDate = freezed,
    Object? mainPicture = freezed,
    Object? favoritedTimes = null,
    Object? lengthSeconds = null,
    Object? publishDate = freezed,
    Object? ratingScore = null,
    Object? tags = null,
    Object? artists = null,
    Object? albums = null,
    Object? lyrics = null,
    Object? pvs = null,
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
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      songType: freezed == songType
          ? _value.songType
          : songType // ignore: cast_nullable_to_non_nullable
              as String?,
      pvServices: freezed == pvServices
          ? _value.pvServices
          : pvServices // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalNames: freezed == additionalNames
          ? _value.additionalNames
          : additionalNames // ignore: cast_nullable_to_non_nullable
              as String?,
      createDate: freezed == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      mainPicture: freezed == mainPicture
          ? _value.mainPicture
          : mainPicture // ignore: cast_nullable_to_non_nullable
              as MainPicture?,
      favoritedTimes: null == favoritedTimes
          ? _value.favoritedTimes
          : favoritedTimes // ignore: cast_nullable_to_non_nullable
              as int,
      lengthSeconds: null == lengthSeconds
          ? _value.lengthSeconds
          : lengthSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      publishDate: freezed == publishDate
          ? _value.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      ratingScore: null == ratingScore
          ? _value.ratingScore
          : ratingScore // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagUsage>,
      artists: null == artists
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<ArtistRole>,
      albums: null == albums
          ? _value.albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<Album>,
      lyrics: null == lyrics
          ? _value.lyrics
          : lyrics // ignore: cast_nullable_to_non_nullable
              as List<Lyric>,
      pvs: null == pvs
          ? _value.pvs
          : pvs // ignore: cast_nullable_to_non_nullable
              as List<PV>,
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
abstract class _$$_SongCopyWith<$Res> implements $SongCopyWith<$Res> {
  factory _$$_SongCopyWith(_$_Song value, $Res Function(_$_Song) then) =
      __$$_SongCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? name,
      String? artistString,
      String? imageUrl,
      String? songType,
      String? pvServices,
      String? additionalNames,
      DateTime? createDate,
      MainPicture? mainPicture,
      int favoritedTimes,
      int lengthSeconds,
      DateTime? publishDate,
      int ratingScore,
      List<TagUsage> tags,
      List<ArtistRole> artists,
      List<Album> albums,
      List<Lyric> lyrics,
      List<PV> pvs,
      List<WebLink> webLinks});

  @override
  $MainPictureCopyWith<$Res>? get mainPicture;
}

/// @nodoc
class __$$_SongCopyWithImpl<$Res> extends _$SongCopyWithImpl<$Res, _$_Song>
    implements _$$_SongCopyWith<$Res> {
  __$$_SongCopyWithImpl(_$_Song _value, $Res Function(_$_Song) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? artistString = freezed,
    Object? imageUrl = freezed,
    Object? songType = freezed,
    Object? pvServices = freezed,
    Object? additionalNames = freezed,
    Object? createDate = freezed,
    Object? mainPicture = freezed,
    Object? favoritedTimes = null,
    Object? lengthSeconds = null,
    Object? publishDate = freezed,
    Object? ratingScore = null,
    Object? tags = null,
    Object? artists = null,
    Object? albums = null,
    Object? lyrics = null,
    Object? pvs = null,
    Object? webLinks = null,
  }) {
    return _then(_$_Song(
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
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      songType: freezed == songType
          ? _value.songType
          : songType // ignore: cast_nullable_to_non_nullable
              as String?,
      pvServices: freezed == pvServices
          ? _value.pvServices
          : pvServices // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalNames: freezed == additionalNames
          ? _value.additionalNames
          : additionalNames // ignore: cast_nullable_to_non_nullable
              as String?,
      createDate: freezed == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      mainPicture: freezed == mainPicture
          ? _value.mainPicture
          : mainPicture // ignore: cast_nullable_to_non_nullable
              as MainPicture?,
      favoritedTimes: null == favoritedTimes
          ? _value.favoritedTimes
          : favoritedTimes // ignore: cast_nullable_to_non_nullable
              as int,
      lengthSeconds: null == lengthSeconds
          ? _value.lengthSeconds
          : lengthSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      publishDate: freezed == publishDate
          ? _value.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      ratingScore: null == ratingScore
          ? _value.ratingScore
          : ratingScore // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagUsage>,
      artists: null == artists
          ? _value._artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<ArtistRole>,
      albums: null == albums
          ? _value._albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<Album>,
      lyrics: null == lyrics
          ? _value._lyrics
          : lyrics // ignore: cast_nullable_to_non_nullable
              as List<Lyric>,
      pvs: null == pvs
          ? _value._pvs
          : pvs // ignore: cast_nullable_to_non_nullable
              as List<PV>,
      webLinks: null == webLinks
          ? _value._webLinks
          : webLinks // ignore: cast_nullable_to_non_nullable
              as List<WebLink>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Song implements _Song {
  const _$_Song(
      {required this.id,
      this.name,
      this.artistString,
      this.imageUrl,
      this.songType,
      this.pvServices,
      this.additionalNames,
      this.createDate,
      this.mainPicture,
      this.favoritedTimes = 0,
      this.lengthSeconds = 0,
      this.publishDate,
      this.ratingScore = 0,
      final List<TagUsage> tags = const [],
      final List<ArtistRole> artists = const [],
      final List<Album> albums = const [],
      final List<Lyric> lyrics = const [],
      final List<PV> pvs = const [],
      final List<WebLink> webLinks = const []})
      : _tags = tags,
        _artists = artists,
        _albums = albums,
        _lyrics = lyrics,
        _pvs = pvs,
        _webLinks = webLinks;

  factory _$_Song.fromJson(Map<String, dynamic> json) => _$$_SongFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final String? artistString;
  @override
  final String? imageUrl;
  @override
  final String? songType;
  @override
  final String? pvServices;
  @override
  final String? additionalNames;
  @override
  final DateTime? createDate;
  @override
  final MainPicture? mainPicture;
  @override
  @JsonKey()
  final int favoritedTimes;
  @override
  @JsonKey()
  final int lengthSeconds;
  @override
  final DateTime? publishDate;
  @override
  @JsonKey()
  final int ratingScore;
  final List<TagUsage> _tags;
  @override
  @JsonKey()
  List<TagUsage> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<ArtistRole> _artists;
  @override
  @JsonKey()
  List<ArtistRole> get artists {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artists);
  }

  final List<Album> _albums;
  @override
  @JsonKey()
  List<Album> get albums {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_albums);
  }

  final List<Lyric> _lyrics;
  @override
  @JsonKey()
  List<Lyric> get lyrics {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lyrics);
  }

  final List<PV> _pvs;
  @override
  @JsonKey()
  List<PV> get pvs {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pvs);
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
    return 'Song(id: $id, name: $name, artistString: $artistString, imageUrl: $imageUrl, songType: $songType, pvServices: $pvServices, additionalNames: $additionalNames, createDate: $createDate, mainPicture: $mainPicture, favoritedTimes: $favoritedTimes, lengthSeconds: $lengthSeconds, publishDate: $publishDate, ratingScore: $ratingScore, tags: $tags, artists: $artists, albums: $albums, lyrics: $lyrics, pvs: $pvs, webLinks: $webLinks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Song &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.artistString, artistString) ||
                other.artistString == artistString) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.songType, songType) ||
                other.songType == songType) &&
            (identical(other.pvServices, pvServices) ||
                other.pvServices == pvServices) &&
            (identical(other.additionalNames, additionalNames) ||
                other.additionalNames == additionalNames) &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate) &&
            (identical(other.mainPicture, mainPicture) ||
                other.mainPicture == mainPicture) &&
            (identical(other.favoritedTimes, favoritedTimes) ||
                other.favoritedTimes == favoritedTimes) &&
            (identical(other.lengthSeconds, lengthSeconds) ||
                other.lengthSeconds == lengthSeconds) &&
            (identical(other.publishDate, publishDate) ||
                other.publishDate == publishDate) &&
            (identical(other.ratingScore, ratingScore) ||
                other.ratingScore == ratingScore) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._artists, _artists) &&
            const DeepCollectionEquality().equals(other._albums, _albums) &&
            const DeepCollectionEquality().equals(other._lyrics, _lyrics) &&
            const DeepCollectionEquality().equals(other._pvs, _pvs) &&
            const DeepCollectionEquality().equals(other._webLinks, _webLinks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        artistString,
        imageUrl,
        songType,
        pvServices,
        additionalNames,
        createDate,
        mainPicture,
        favoritedTimes,
        lengthSeconds,
        publishDate,
        ratingScore,
        const DeepCollectionEquality().hash(_tags),
        const DeepCollectionEquality().hash(_artists),
        const DeepCollectionEquality().hash(_albums),
        const DeepCollectionEquality().hash(_lyrics),
        const DeepCollectionEquality().hash(_pvs),
        const DeepCollectionEquality().hash(_webLinks)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SongCopyWith<_$_Song> get copyWith =>
      __$$_SongCopyWithImpl<_$_Song>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SongToJson(
      this,
    );
  }
}

abstract class _Song implements Song {
  const factory _Song(
      {required final int id,
      final String? name,
      final String? artistString,
      final String? imageUrl,
      final String? songType,
      final String? pvServices,
      final String? additionalNames,
      final DateTime? createDate,
      final MainPicture? mainPicture,
      final int favoritedTimes,
      final int lengthSeconds,
      final DateTime? publishDate,
      final int ratingScore,
      final List<TagUsage> tags,
      final List<ArtistRole> artists,
      final List<Album> albums,
      final List<Lyric> lyrics,
      final List<PV> pvs,
      final List<WebLink> webLinks}) = _$_Song;

  factory _Song.fromJson(Map<String, dynamic> json) = _$_Song.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  String? get artistString;
  @override
  String? get imageUrl;
  @override
  String? get songType;
  @override
  String? get pvServices;
  @override
  String? get additionalNames;
  @override
  DateTime? get createDate;
  @override
  MainPicture? get mainPicture;
  @override
  int get favoritedTimes;
  @override
  int get lengthSeconds;
  @override
  DateTime? get publishDate;
  @override
  int get ratingScore;
  @override
  List<TagUsage> get tags;
  @override
  List<ArtistRole> get artists;
  @override
  List<Album> get albums;
  @override
  List<Lyric> get lyrics;
  @override
  List<PV> get pvs;
  @override
  List<WebLink> get webLinks;
  @override
  @JsonKey(ignore: true)
  _$$_SongCopyWith<_$_Song> get copyWith => throw _privateConstructorUsedError;
}
