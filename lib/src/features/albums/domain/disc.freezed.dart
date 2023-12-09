// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'disc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Disc _$DiscFromJson(Map<String, dynamic> json) {
  return _Disc.fromJson(json);
}

/// @nodoc
mixin _$Disc {
  int? get id => throw _privateConstructorUsedError;
  int? get discNumber => throw _privateConstructorUsedError;
  String? get mediaType => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiscCopyWith<Disc> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscCopyWith<$Res> {
  factory $DiscCopyWith(Disc value, $Res Function(Disc) then) =
      _$DiscCopyWithImpl<$Res, Disc>;
  @useResult
  $Res call({int? id, int? discNumber, String? mediaType, String? name});
}

/// @nodoc
class _$DiscCopyWithImpl<$Res, $Val extends Disc>
    implements $DiscCopyWith<$Res> {
  _$DiscCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? discNumber = freezed,
    Object? mediaType = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      discNumber: freezed == discNumber
          ? _value.discNumber
          : discNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiscCopyWith<$Res> implements $DiscCopyWith<$Res> {
  factory _$$_DiscCopyWith(_$_Disc value, $Res Function(_$_Disc) then) =
      __$$_DiscCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? discNumber, String? mediaType, String? name});
}

/// @nodoc
class __$$_DiscCopyWithImpl<$Res> extends _$DiscCopyWithImpl<$Res, _$_Disc>
    implements _$$_DiscCopyWith<$Res> {
  __$$_DiscCopyWithImpl(_$_Disc _value, $Res Function(_$_Disc) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? discNumber = freezed,
    Object? mediaType = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_Disc(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      discNumber: freezed == discNumber
          ? _value.discNumber
          : discNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Disc implements _Disc {
  _$_Disc({this.id, this.discNumber, this.mediaType, this.name});

  factory _$_Disc.fromJson(Map<String, dynamic> json) => _$$_DiscFromJson(json);

  @override
  final int? id;
  @override
  final int? discNumber;
  @override
  final String? mediaType;
  @override
  final String? name;

  @override
  String toString() {
    return 'Disc(id: $id, discNumber: $discNumber, mediaType: $mediaType, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Disc &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.discNumber, discNumber) ||
                other.discNumber == discNumber) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, discNumber, mediaType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiscCopyWith<_$_Disc> get copyWith =>
      __$$_DiscCopyWithImpl<_$_Disc>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiscToJson(
      this,
    );
  }
}

abstract class _Disc implements Disc {
  factory _Disc(
      {final int? id,
      final int? discNumber,
      final String? mediaType,
      final String? name}) = _$_Disc;

  factory _Disc.fromJson(Map<String, dynamic> json) = _$_Disc.fromJson;

  @override
  int? get id;
  @override
  int? get discNumber;
  @override
  String? get mediaType;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_DiscCopyWith<_$_Disc> get copyWith => throw _privateConstructorUsedError;
}
