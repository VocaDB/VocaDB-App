// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

/// @nodoc
mixin _$AppUser {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  MainPicture? get mainPicture => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res, AppUser>;
  @useResult
  $Res call({int id, String name, MainPicture? mainPicture});

  $MainPictureCopyWith<$Res>? get mainPicture;
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? mainPicture = freezed,
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
      mainPicture: freezed == mainPicture
          ? _value.mainPicture
          : mainPicture // ignore: cast_nullable_to_non_nullable
              as MainPicture?,
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
abstract class _$$_AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$_AppUserCopyWith(
          _$_AppUser value, $Res Function(_$_AppUser) then) =
      __$$_AppUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, MainPicture? mainPicture});

  @override
  $MainPictureCopyWith<$Res>? get mainPicture;
}

/// @nodoc
class __$$_AppUserCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$_AppUser>
    implements _$$_AppUserCopyWith<$Res> {
  __$$_AppUserCopyWithImpl(_$_AppUser _value, $Res Function(_$_AppUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? mainPicture = freezed,
  }) {
    return _then(_$_AppUser(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mainPicture: freezed == mainPicture
          ? _value.mainPicture
          : mainPicture // ignore: cast_nullable_to_non_nullable
              as MainPicture?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppUser implements _AppUser {
  const _$_AppUser({required this.id, required this.name, this.mainPicture});

  factory _$_AppUser.fromJson(Map<String, dynamic> json) =>
      _$$_AppUserFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final MainPicture? mainPicture;

  @override
  String toString() {
    return 'AppUser(id: $id, name: $name, mainPicture: $mainPicture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mainPicture, mainPicture) ||
                other.mainPicture == mainPicture));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, mainPicture);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      __$$_AppUserCopyWithImpl<_$_AppUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppUserToJson(
      this,
    );
  }
}

abstract class _AppUser implements AppUser {
  const factory _AppUser(
      {required final int id,
      required final String name,
      final MainPicture? mainPicture}) = _$_AppUser;

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$_AppUser.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  MainPicture? get mainPicture;
  @override
  @JsonKey(ignore: true)
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      throw _privateConstructorUsedError;
}
