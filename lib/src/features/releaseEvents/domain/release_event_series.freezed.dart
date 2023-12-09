// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'release_event_series.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReleaseEventSeries _$ReleaseEventSeriesFromJson(Map<String, dynamic> json) {
  return _ReleaseEventSeries.fromJson(json);
}

/// @nodoc
mixin _$ReleaseEventSeries {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get additionalNames => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  List<ReleaseEvent> get events => throw _privateConstructorUsedError;
  MainPicture? get mainPicture => throw _privateConstructorUsedError;
  List<WebLink> get webLinks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReleaseEventSeriesCopyWith<ReleaseEventSeries> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReleaseEventSeriesCopyWith<$Res> {
  factory $ReleaseEventSeriesCopyWith(
          ReleaseEventSeries value, $Res Function(ReleaseEventSeries) then) =
      _$ReleaseEventSeriesCopyWithImpl<$Res, ReleaseEventSeries>;
  @useResult
  $Res call(
      {int id,
      String? name,
      String? additionalNames,
      String? description,
      String? category,
      List<ReleaseEvent> events,
      MainPicture? mainPicture,
      List<WebLink> webLinks});

  $MainPictureCopyWith<$Res>? get mainPicture;
}

/// @nodoc
class _$ReleaseEventSeriesCopyWithImpl<$Res, $Val extends ReleaseEventSeries>
    implements $ReleaseEventSeriesCopyWith<$Res> {
  _$ReleaseEventSeriesCopyWithImpl(this._value, this._then);

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
    Object? category = freezed,
    Object? events = null,
    Object? mainPicture = freezed,
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
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<ReleaseEvent>,
      mainPicture: freezed == mainPicture
          ? _value.mainPicture
          : mainPicture // ignore: cast_nullable_to_non_nullable
              as MainPicture?,
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
abstract class _$$_ReleaseEventSeriesCopyWith<$Res>
    implements $ReleaseEventSeriesCopyWith<$Res> {
  factory _$$_ReleaseEventSeriesCopyWith(_$_ReleaseEventSeries value,
          $Res Function(_$_ReleaseEventSeries) then) =
      __$$_ReleaseEventSeriesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? name,
      String? additionalNames,
      String? description,
      String? category,
      List<ReleaseEvent> events,
      MainPicture? mainPicture,
      List<WebLink> webLinks});

  @override
  $MainPictureCopyWith<$Res>? get mainPicture;
}

/// @nodoc
class __$$_ReleaseEventSeriesCopyWithImpl<$Res>
    extends _$ReleaseEventSeriesCopyWithImpl<$Res, _$_ReleaseEventSeries>
    implements _$$_ReleaseEventSeriesCopyWith<$Res> {
  __$$_ReleaseEventSeriesCopyWithImpl(
      _$_ReleaseEventSeries _value, $Res Function(_$_ReleaseEventSeries) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? additionalNames = freezed,
    Object? description = freezed,
    Object? category = freezed,
    Object? events = null,
    Object? mainPicture = freezed,
    Object? webLinks = null,
  }) {
    return _then(_$_ReleaseEventSeries(
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
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<ReleaseEvent>,
      mainPicture: freezed == mainPicture
          ? _value.mainPicture
          : mainPicture // ignore: cast_nullable_to_non_nullable
              as MainPicture?,
      webLinks: null == webLinks
          ? _value._webLinks
          : webLinks // ignore: cast_nullable_to_non_nullable
              as List<WebLink>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReleaseEventSeries implements _ReleaseEventSeries {
  _$_ReleaseEventSeries(
      {required this.id,
      this.name,
      this.additionalNames,
      this.description,
      this.category,
      final List<ReleaseEvent> events = const [],
      this.mainPicture,
      final List<WebLink> webLinks = const []})
      : _events = events,
        _webLinks = webLinks;

  factory _$_ReleaseEventSeries.fromJson(Map<String, dynamic> json) =>
      _$$_ReleaseEventSeriesFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final String? additionalNames;
  @override
  final String? description;
  @override
  final String? category;
  final List<ReleaseEvent> _events;
  @override
  @JsonKey()
  List<ReleaseEvent> get events {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  final MainPicture? mainPicture;
  final List<WebLink> _webLinks;
  @override
  @JsonKey()
  List<WebLink> get webLinks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_webLinks);
  }

  @override
  String toString() {
    return 'ReleaseEventSeries(id: $id, name: $name, additionalNames: $additionalNames, description: $description, category: $category, events: $events, mainPicture: $mainPicture, webLinks: $webLinks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReleaseEventSeries &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.additionalNames, additionalNames) ||
                other.additionalNames == additionalNames) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.mainPicture, mainPicture) ||
                other.mainPicture == mainPicture) &&
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
      category,
      const DeepCollectionEquality().hash(_events),
      mainPicture,
      const DeepCollectionEquality().hash(_webLinks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReleaseEventSeriesCopyWith<_$_ReleaseEventSeries> get copyWith =>
      __$$_ReleaseEventSeriesCopyWithImpl<_$_ReleaseEventSeries>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReleaseEventSeriesToJson(
      this,
    );
  }
}

abstract class _ReleaseEventSeries implements ReleaseEventSeries {
  factory _ReleaseEventSeries(
      {required final int id,
      final String? name,
      final String? additionalNames,
      final String? description,
      final String? category,
      final List<ReleaseEvent> events,
      final MainPicture? mainPicture,
      final List<WebLink> webLinks}) = _$_ReleaseEventSeries;

  factory _ReleaseEventSeries.fromJson(Map<String, dynamic> json) =
      _$_ReleaseEventSeries.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  String? get additionalNames;
  @override
  String? get description;
  @override
  String? get category;
  @override
  List<ReleaseEvent> get events;
  @override
  MainPicture? get mainPicture;
  @override
  List<WebLink> get webLinks;
  @override
  @JsonKey(ignore: true)
  _$$_ReleaseEventSeriesCopyWith<_$_ReleaseEventSeries> get copyWith =>
      throw _privateConstructorUsedError;
}
