// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'lyric.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Lyric _$LyricFromJson(Map<String, dynamic> json) {
  return _Lyric.fromJson(json);
}

/// @nodoc
mixin _$Lyric {
  int get id => throw _privateConstructorUsedError;
  String? get cultureCode => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;
  String? get translationType => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LyricCopyWith<Lyric> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LyricCopyWith<$Res> {
  factory $LyricCopyWith(Lyric value, $Res Function(Lyric) then) =
      _$LyricCopyWithImpl<$Res, Lyric>;
  @useResult
  $Res call(
      {int id,
      String? cultureCode,
      String? source,
      String? translationType,
      String? url,
      String? value});
}

/// @nodoc
class _$LyricCopyWithImpl<$Res, $Val extends Lyric>
    implements $LyricCopyWith<$Res> {
  _$LyricCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cultureCode = freezed,
    Object? source = freezed,
    Object? translationType = freezed,
    Object? url = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cultureCode: freezed == cultureCode
          ? _value.cultureCode
          : cultureCode // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      translationType: freezed == translationType
          ? _value.translationType
          : translationType // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LyricCopyWith<$Res> implements $LyricCopyWith<$Res> {
  factory _$$_LyricCopyWith(_$_Lyric value, $Res Function(_$_Lyric) then) =
      __$$_LyricCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? cultureCode,
      String? source,
      String? translationType,
      String? url,
      String? value});
}

/// @nodoc
class __$$_LyricCopyWithImpl<$Res> extends _$LyricCopyWithImpl<$Res, _$_Lyric>
    implements _$$_LyricCopyWith<$Res> {
  __$$_LyricCopyWithImpl(_$_Lyric _value, $Res Function(_$_Lyric) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cultureCode = freezed,
    Object? source = freezed,
    Object? translationType = freezed,
    Object? url = freezed,
    Object? value = freezed,
  }) {
    return _then(_$_Lyric(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cultureCode: freezed == cultureCode
          ? _value.cultureCode
          : cultureCode // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      translationType: freezed == translationType
          ? _value.translationType
          : translationType // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Lyric implements _Lyric {
  _$_Lyric(
      {required this.id,
      this.cultureCode,
      this.source,
      this.translationType,
      this.url,
      this.value});

  factory _$_Lyric.fromJson(Map<String, dynamic> json) =>
      _$$_LyricFromJson(json);

  @override
  final int id;
  @override
  final String? cultureCode;
  @override
  final String? source;
  @override
  final String? translationType;
  @override
  final String? url;
  @override
  final String? value;

  @override
  String toString() {
    return 'Lyric(id: $id, cultureCode: $cultureCode, source: $source, translationType: $translationType, url: $url, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Lyric &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cultureCode, cultureCode) ||
                other.cultureCode == cultureCode) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.translationType, translationType) ||
                other.translationType == translationType) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, cultureCode, source, translationType, url, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LyricCopyWith<_$_Lyric> get copyWith =>
      __$$_LyricCopyWithImpl<_$_Lyric>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LyricToJson(
      this,
    );
  }
}

abstract class _Lyric implements Lyric {
  factory _Lyric(
      {required final int id,
      final String? cultureCode,
      final String? source,
      final String? translationType,
      final String? url,
      final String? value}) = _$_Lyric;

  factory _Lyric.fromJson(Map<String, dynamic> json) = _$_Lyric.fromJson;

  @override
  int get id;
  @override
  String? get cultureCode;
  @override
  String? get source;
  @override
  String? get translationType;
  @override
  String? get url;
  @override
  String? get value;
  @override
  @JsonKey(ignore: true)
  _$$_LyricCopyWith<_$_Lyric> get copyWith =>
      throw _privateConstructorUsedError;
}
