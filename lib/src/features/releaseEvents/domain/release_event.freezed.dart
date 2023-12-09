// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'release_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReleaseEvent _$ReleaseEventFromJson(Map<String, dynamic> json) {
  return _ReleaseEvent.fromJson(json);
}

/// @nodoc
mixin _$ReleaseEvent {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get additionalNames => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get venueName => throw _privateConstructorUsedError;
  MainPicture? get mainPicture => throw _privateConstructorUsedError;
  List<ArtistRole>? get artists => throw _privateConstructorUsedError;
  ReleaseEventSeries? get series => throw _privateConstructorUsedError;
  List<TagUsage>? get tags => throw _privateConstructorUsedError;
  List<WebLink> get webLinks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReleaseEventCopyWith<ReleaseEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReleaseEventCopyWith<$Res> {
  factory $ReleaseEventCopyWith(
          ReleaseEvent value, $Res Function(ReleaseEvent) then) =
      _$ReleaseEventCopyWithImpl<$Res, ReleaseEvent>;
  @useResult
  $Res call(
      {int id,
      String? name,
      String? additionalNames,
      String? description,
      DateTime? date,
      DateTime? endDate,
      String? category,
      String? venueName,
      MainPicture? mainPicture,
      List<ArtistRole>? artists,
      ReleaseEventSeries? series,
      List<TagUsage>? tags,
      List<WebLink> webLinks});

  $MainPictureCopyWith<$Res>? get mainPicture;
  $ReleaseEventSeriesCopyWith<$Res>? get series;
}

/// @nodoc
class _$ReleaseEventCopyWithImpl<$Res, $Val extends ReleaseEvent>
    implements $ReleaseEventCopyWith<$Res> {
  _$ReleaseEventCopyWithImpl(this._value, this._then);

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
    Object? description = freezed,
    Object? date = freezed,
    Object? endDate = freezed,
    Object? category = freezed,
    Object? venueName = freezed,
    Object? mainPicture = freezed,
    Object? artists = freezed,
    Object? series = freezed,
    Object? tags = freezed,
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
      additionalNames: freezed == additionalNames
          ? _value.additionalNames
          : additionalNames // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      venueName: freezed == venueName
          ? _value.venueName
          : venueName // ignore: cast_nullable_to_non_nullable
              as String?,
      mainPicture: freezed == mainPicture
          ? _value.mainPicture
          : mainPicture // ignore: cast_nullable_to_non_nullable
              as MainPicture?,
      artists: freezed == artists
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<ArtistRole>?,
      series: freezed == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as ReleaseEventSeries?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagUsage>?,
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
  $ReleaseEventSeriesCopyWith<$Res>? get series {
    if (_value.series == null) {
      return null;
    }

    return $ReleaseEventSeriesCopyWith<$Res>(_value.series!, (value) {
      return _then(_value.copyWith(series: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReleaseEventCopyWith<$Res>
    implements $ReleaseEventCopyWith<$Res> {
  factory _$$_ReleaseEventCopyWith(
          _$_ReleaseEvent value, $Res Function(_$_ReleaseEvent) then) =
      __$$_ReleaseEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? name,
      String? additionalNames,
      String? description,
      DateTime? date,
      DateTime? endDate,
      String? category,
      String? venueName,
      MainPicture? mainPicture,
      List<ArtistRole>? artists,
      ReleaseEventSeries? series,
      List<TagUsage>? tags,
      List<WebLink> webLinks});

  @override
  $MainPictureCopyWith<$Res>? get mainPicture;
  @override
  $ReleaseEventSeriesCopyWith<$Res>? get series;
}

/// @nodoc
class __$$_ReleaseEventCopyWithImpl<$Res>
    extends _$ReleaseEventCopyWithImpl<$Res, _$_ReleaseEvent>
    implements _$$_ReleaseEventCopyWith<$Res> {
  __$$_ReleaseEventCopyWithImpl(
      _$_ReleaseEvent _value, $Res Function(_$_ReleaseEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? additionalNames = freezed,
    Object? description = freezed,
    Object? date = freezed,
    Object? endDate = freezed,
    Object? category = freezed,
    Object? venueName = freezed,
    Object? mainPicture = freezed,
    Object? artists = freezed,
    Object? series = freezed,
    Object? tags = freezed,
    Object? webLinks = null,
  }) {
    return _then(_$_ReleaseEvent(
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      venueName: freezed == venueName
          ? _value.venueName
          : venueName // ignore: cast_nullable_to_non_nullable
              as String?,
      mainPicture: freezed == mainPicture
          ? _value.mainPicture
          : mainPicture // ignore: cast_nullable_to_non_nullable
              as MainPicture?,
      artists: freezed == artists
          ? _value._artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<ArtistRole>?,
      series: freezed == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as ReleaseEventSeries?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagUsage>?,
      webLinks: null == webLinks
          ? _value._webLinks
          : webLinks // ignore: cast_nullable_to_non_nullable
              as List<WebLink>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReleaseEvent implements _ReleaseEvent {
  _$_ReleaseEvent(
      {required this.id,
      this.name,
      this.additionalNames,
      this.description,
      this.date,
      this.endDate,
      this.category,
      this.venueName,
      this.mainPicture,
      final List<ArtistRole>? artists = const [],
      this.series,
      final List<TagUsage>? tags = const [],
      final List<WebLink> webLinks = const []})
      : _artists = artists,
        _tags = tags,
        _webLinks = webLinks;

  factory _$_ReleaseEvent.fromJson(Map<String, dynamic> json) =>
      _$$_ReleaseEventFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final String? additionalNames;
  @override
  final String? description;
  @override
  final DateTime? date;
  @override
  final DateTime? endDate;
  @override
  final String? category;
  @override
  final String? venueName;
  @override
  final MainPicture? mainPicture;
  final List<ArtistRole>? _artists;
  @override
  @JsonKey()
  List<ArtistRole>? get artists {
    final value = _artists;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ReleaseEventSeries? series;
  final List<TagUsage>? _tags;
  @override
  @JsonKey()
  List<TagUsage>? get tags {
    final value = _tags;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
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
    return 'ReleaseEvent(id: $id, name: $name, additionalNames: $additionalNames, description: $description, date: $date, endDate: $endDate, category: $category, venueName: $venueName, mainPicture: $mainPicture, artists: $artists, series: $series, tags: $tags, webLinks: $webLinks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReleaseEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.additionalNames, additionalNames) ||
                other.additionalNames == additionalNames) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.venueName, venueName) ||
                other.venueName == venueName) &&
            (identical(other.mainPicture, mainPicture) ||
                other.mainPicture == mainPicture) &&
            const DeepCollectionEquality().equals(other._artists, _artists) &&
            (identical(other.series, series) || other.series == series) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._webLinks, _webLinks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      additionalNames,
      description,
      date,
      endDate,
      category,
      venueName,
      mainPicture,
      const DeepCollectionEquality().hash(_artists),
      series,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_webLinks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReleaseEventCopyWith<_$_ReleaseEvent> get copyWith =>
      __$$_ReleaseEventCopyWithImpl<_$_ReleaseEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReleaseEventToJson(
      this,
    );
  }
}

abstract class _ReleaseEvent implements ReleaseEvent {
  factory _ReleaseEvent(
      {required final int id,
      final String? name,
      final String? additionalNames,
      final String? description,
      final DateTime? date,
      final DateTime? endDate,
      final String? category,
      final String? venueName,
      final MainPicture? mainPicture,
      final List<ArtistRole>? artists,
      final ReleaseEventSeries? series,
      final List<TagUsage>? tags,
      final List<WebLink> webLinks}) = _$_ReleaseEvent;

  factory _ReleaseEvent.fromJson(Map<String, dynamic> json) =
      _$_ReleaseEvent.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  String? get additionalNames;
  @override
  String? get description;
  @override
  DateTime? get date;
  @override
  DateTime? get endDate;
  @override
  String? get category;
  @override
  String? get venueName;
  @override
  MainPicture? get mainPicture;
  @override
  List<ArtistRole>? get artists;
  @override
  ReleaseEventSeries? get series;
  @override
  List<TagUsage>? get tags;
  @override
  List<WebLink> get webLinks;
  @override
  @JsonKey(ignore: true)
  _$$_ReleaseEventCopyWith<_$_ReleaseEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
