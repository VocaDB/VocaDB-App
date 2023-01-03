// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'release_date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReleaseDate _$ReleaseDateFromJson(Map<String, dynamic> json) {
  return _ReleaseDate.fromJson(json);
}

/// @nodoc
mixin _$ReleaseDate {
  int get day => throw _privateConstructorUsedError;
  String get formatted => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReleaseDateCopyWith<ReleaseDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReleaseDateCopyWith<$Res> {
  factory $ReleaseDateCopyWith(
          ReleaseDate value, $Res Function(ReleaseDate) then) =
      _$ReleaseDateCopyWithImpl<$Res, ReleaseDate>;
  @useResult
  $Res call({int day, String formatted, int month, int year});
}

/// @nodoc
class _$ReleaseDateCopyWithImpl<$Res, $Val extends ReleaseDate>
    implements $ReleaseDateCopyWith<$Res> {
  _$ReleaseDateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? formatted = null,
    Object? month = null,
    Object? year = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      formatted: null == formatted
          ? _value.formatted
          : formatted // ignore: cast_nullable_to_non_nullable
              as String,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReleaseDateCopyWith<$Res>
    implements $ReleaseDateCopyWith<$Res> {
  factory _$$_ReleaseDateCopyWith(
          _$_ReleaseDate value, $Res Function(_$_ReleaseDate) then) =
      __$$_ReleaseDateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int day, String formatted, int month, int year});
}

/// @nodoc
class __$$_ReleaseDateCopyWithImpl<$Res>
    extends _$ReleaseDateCopyWithImpl<$Res, _$_ReleaseDate>
    implements _$$_ReleaseDateCopyWith<$Res> {
  __$$_ReleaseDateCopyWithImpl(
      _$_ReleaseDate _value, $Res Function(_$_ReleaseDate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? formatted = null,
    Object? month = null,
    Object? year = null,
  }) {
    return _then(_$_ReleaseDate(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      formatted: null == formatted
          ? _value.formatted
          : formatted // ignore: cast_nullable_to_non_nullable
              as String,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReleaseDate implements _ReleaseDate {
  _$_ReleaseDate(
      {this.day = 0, this.formatted = '', this.month = 0, this.year = 0});

  factory _$_ReleaseDate.fromJson(Map<String, dynamic> json) =>
      _$$_ReleaseDateFromJson(json);

  @override
  @JsonKey()
  final int day;
  @override
  @JsonKey()
  final String formatted;
  @override
  @JsonKey()
  final int month;
  @override
  @JsonKey()
  final int year;

  @override
  String toString() {
    return 'ReleaseDate(day: $day, formatted: $formatted, month: $month, year: $year)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReleaseDate &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.formatted, formatted) ||
                other.formatted == formatted) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, day, formatted, month, year);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReleaseDateCopyWith<_$_ReleaseDate> get copyWith =>
      __$$_ReleaseDateCopyWithImpl<_$_ReleaseDate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReleaseDateToJson(
      this,
    );
  }
}

abstract class _ReleaseDate implements ReleaseDate {
  factory _ReleaseDate(
      {final int day,
      final String formatted,
      final int month,
      final int year}) = _$_ReleaseDate;

  factory _ReleaseDate.fromJson(Map<String, dynamic> json) =
      _$_ReleaseDate.fromJson;

  @override
  int get day;
  @override
  String get formatted;
  @override
  int get month;
  @override
  int get year;
  @override
  @JsonKey(ignore: true)
  _$$_ReleaseDateCopyWith<_$_ReleaseDate> get copyWith =>
      throw _privateConstructorUsedError;
}
