// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pv.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PV _$PVFromJson(Map<String, dynamic> json) {
  return _PV.fromJson(json);
}

/// @nodoc
mixin _$PV {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get service => throw _privateConstructorUsedError;
  String get pvType => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PVCopyWith<PV> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PVCopyWith<$Res> {
  factory $PVCopyWith(PV value, $Res Function(PV) then) =
      _$PVCopyWithImpl<$Res, PV>;
  @useResult
  $Res call({int id, String name, String service, String pvType, String url});
}

/// @nodoc
class _$PVCopyWithImpl<$Res, $Val extends PV> implements $PVCopyWith<$Res> {
  _$PVCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? service = null,
    Object? pvType = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      pvType: null == pvType
          ? _value.pvType
          : pvType // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PVCopyWith<$Res> implements $PVCopyWith<$Res> {
  factory _$$_PVCopyWith(_$_PV value, $Res Function(_$_PV) then) =
      __$$_PVCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String service, String pvType, String url});
}

/// @nodoc
class __$$_PVCopyWithImpl<$Res> extends _$PVCopyWithImpl<$Res, _$_PV>
    implements _$$_PVCopyWith<$Res> {
  __$$_PVCopyWithImpl(_$_PV _value, $Res Function(_$_PV) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? service = null,
    Object? pvType = null,
    Object? url = null,
  }) {
    return _then(_$_PV(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      pvType: null == pvType
          ? _value.pvType
          : pvType // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PV implements _PV {
  _$_PV(
      {required this.id,
      required this.name,
      required this.service,
      required this.pvType,
      required this.url});

  factory _$_PV.fromJson(Map<String, dynamic> json) => _$$_PVFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String service;
  @override
  final String pvType;
  @override
  final String url;

  @override
  String toString() {
    return 'PV(id: $id, name: $name, service: $service, pvType: $pvType, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PV &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.pvType, pvType) || other.pvType == pvType) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, service, pvType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PVCopyWith<_$_PV> get copyWith =>
      __$$_PVCopyWithImpl<_$_PV>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PVToJson(
      this,
    );
  }
}

abstract class _PV implements PV {
  factory _PV(
      {required final int id,
      required final String name,
      required final String service,
      required final String pvType,
      required final String url}) = _$_PV;

  factory _PV.fromJson(Map<String, dynamic> json) = _$_PV.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get service;
  @override
  String get pvType;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_PVCopyWith<_$_PV> get copyWith => throw _privateConstructorUsedError;
}
