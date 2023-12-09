// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'main_picture.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MainPicture _$MainPictureFromJson(Map<String, dynamic> json) {
  return _MainPicture.fromJson(json);
}

/// @nodoc
mixin _$MainPicture {
  String? get mime => throw _privateConstructorUsedError;
  String? get urlSmallThumb => throw _privateConstructorUsedError;
  String? get urlThumb => throw _privateConstructorUsedError;
  String? get urlTinyThumb => throw _privateConstructorUsedError;
  String? get urlOriginal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MainPictureCopyWith<MainPicture> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainPictureCopyWith<$Res> {
  factory $MainPictureCopyWith(
          MainPicture value, $Res Function(MainPicture) then) =
      _$MainPictureCopyWithImpl<$Res, MainPicture>;
  @useResult
  $Res call(
      {String? mime,
      String? urlSmallThumb,
      String? urlThumb,
      String? urlTinyThumb,
      String? urlOriginal});
}

/// @nodoc
class _$MainPictureCopyWithImpl<$Res, $Val extends MainPicture>
    implements $MainPictureCopyWith<$Res> {
  _$MainPictureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mime = freezed,
    Object? urlSmallThumb = freezed,
    Object? urlThumb = freezed,
    Object? urlTinyThumb = freezed,
    Object? urlOriginal = freezed,
  }) {
    return _then(_value.copyWith(
      mime: freezed == mime
          ? _value.mime
          : mime // ignore: cast_nullable_to_non_nullable
              as String?,
      urlSmallThumb: freezed == urlSmallThumb
          ? _value.urlSmallThumb
          : urlSmallThumb // ignore: cast_nullable_to_non_nullable
              as String?,
      urlThumb: freezed == urlThumb
          ? _value.urlThumb
          : urlThumb // ignore: cast_nullable_to_non_nullable
              as String?,
      urlTinyThumb: freezed == urlTinyThumb
          ? _value.urlTinyThumb
          : urlTinyThumb // ignore: cast_nullable_to_non_nullable
              as String?,
      urlOriginal: freezed == urlOriginal
          ? _value.urlOriginal
          : urlOriginal // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MainPictureCopyWith<$Res>
    implements $MainPictureCopyWith<$Res> {
  factory _$$_MainPictureCopyWith(
          _$_MainPicture value, $Res Function(_$_MainPicture) then) =
      __$$_MainPictureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? mime,
      String? urlSmallThumb,
      String? urlThumb,
      String? urlTinyThumb,
      String? urlOriginal});
}

/// @nodoc
class __$$_MainPictureCopyWithImpl<$Res>
    extends _$MainPictureCopyWithImpl<$Res, _$_MainPicture>
    implements _$$_MainPictureCopyWith<$Res> {
  __$$_MainPictureCopyWithImpl(
      _$_MainPicture _value, $Res Function(_$_MainPicture) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mime = freezed,
    Object? urlSmallThumb = freezed,
    Object? urlThumb = freezed,
    Object? urlTinyThumb = freezed,
    Object? urlOriginal = freezed,
  }) {
    return _then(_$_MainPicture(
      mime: freezed == mime
          ? _value.mime
          : mime // ignore: cast_nullable_to_non_nullable
              as String?,
      urlSmallThumb: freezed == urlSmallThumb
          ? _value.urlSmallThumb
          : urlSmallThumb // ignore: cast_nullable_to_non_nullable
              as String?,
      urlThumb: freezed == urlThumb
          ? _value.urlThumb
          : urlThumb // ignore: cast_nullable_to_non_nullable
              as String?,
      urlTinyThumb: freezed == urlTinyThumb
          ? _value.urlTinyThumb
          : urlTinyThumb // ignore: cast_nullable_to_non_nullable
              as String?,
      urlOriginal: freezed == urlOriginal
          ? _value.urlOriginal
          : urlOriginal // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MainPicture implements _MainPicture {
  _$_MainPicture(
      {this.mime,
      this.urlSmallThumb,
      this.urlThumb,
      this.urlTinyThumb,
      this.urlOriginal});

  factory _$_MainPicture.fromJson(Map<String, dynamic> json) =>
      _$$_MainPictureFromJson(json);

  @override
  final String? mime;
  @override
  final String? urlSmallThumb;
  @override
  final String? urlThumb;
  @override
  final String? urlTinyThumb;
  @override
  final String? urlOriginal;

  @override
  String toString() {
    return 'MainPicture(mime: $mime, urlSmallThumb: $urlSmallThumb, urlThumb: $urlThumb, urlTinyThumb: $urlTinyThumb, urlOriginal: $urlOriginal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainPicture &&
            (identical(other.mime, mime) || other.mime == mime) &&
            (identical(other.urlSmallThumb, urlSmallThumb) ||
                other.urlSmallThumb == urlSmallThumb) &&
            (identical(other.urlThumb, urlThumb) ||
                other.urlThumb == urlThumb) &&
            (identical(other.urlTinyThumb, urlTinyThumb) ||
                other.urlTinyThumb == urlTinyThumb) &&
            (identical(other.urlOriginal, urlOriginal) ||
                other.urlOriginal == urlOriginal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, mime, urlSmallThumb, urlThumb, urlTinyThumb, urlOriginal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainPictureCopyWith<_$_MainPicture> get copyWith =>
      __$$_MainPictureCopyWithImpl<_$_MainPicture>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MainPictureToJson(
      this,
    );
  }
}

abstract class _MainPicture implements MainPicture {
  factory _MainPicture(
      {final String? mime,
      final String? urlSmallThumb,
      final String? urlThumb,
      final String? urlTinyThumb,
      final String? urlOriginal}) = _$_MainPicture;

  factory _MainPicture.fromJson(Map<String, dynamic> json) =
      _$_MainPicture.fromJson;

  @override
  String? get mime;
  @override
  String? get urlSmallThumb;
  @override
  String? get urlThumb;
  @override
  String? get urlTinyThumb;
  @override
  String? get urlOriginal;
  @override
  @JsonKey(ignore: true)
  _$$_MainPictureCopyWith<_$_MainPicture> get copyWith =>
      throw _privateConstructorUsedError;
}
