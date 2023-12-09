// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'artist_role.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArtistRole _$ArtistRoleFromJson(Map<String, dynamic> json) {
  return _ArtistRole.fromJson(json);
}

/// @nodoc
mixin _$ArtistRole {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get categories => throw _privateConstructorUsedError;
  String get effectiveRoles => throw _privateConstructorUsedError;
  String get roles => throw _privateConstructorUsedError;
  Artist? get artist => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtistRoleCopyWith<ArtistRole> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistRoleCopyWith<$Res> {
  factory $ArtistRoleCopyWith(
          ArtistRole value, $Res Function(ArtistRole) then) =
      _$ArtistRoleCopyWithImpl<$Res, ArtistRole>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? categories,
      String effectiveRoles,
      String roles,
      Artist? artist});

  $ArtistCopyWith<$Res>? get artist;
}

/// @nodoc
class _$ArtistRoleCopyWithImpl<$Res, $Val extends ArtistRole>
    implements $ArtistRoleCopyWith<$Res> {
  _$ArtistRoleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? categories = freezed,
    Object? effectiveRoles = null,
    Object? roles = null,
    Object? artist = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as String?,
      effectiveRoles: null == effectiveRoles
          ? _value.effectiveRoles
          : effectiveRoles // ignore: cast_nullable_to_non_nullable
              as String,
      roles: null == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as String,
      artist: freezed == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as Artist?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ArtistCopyWith<$Res>? get artist {
    if (_value.artist == null) {
      return null;
    }

    return $ArtistCopyWith<$Res>(_value.artist!, (value) {
      return _then(_value.copyWith(artist: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ArtistRoleCopyWith<$Res>
    implements $ArtistRoleCopyWith<$Res> {
  factory _$$_ArtistRoleCopyWith(
          _$_ArtistRole value, $Res Function(_$_ArtistRole) then) =
      __$$_ArtistRoleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? categories,
      String effectiveRoles,
      String roles,
      Artist? artist});

  @override
  $ArtistCopyWith<$Res>? get artist;
}

/// @nodoc
class __$$_ArtistRoleCopyWithImpl<$Res>
    extends _$ArtistRoleCopyWithImpl<$Res, _$_ArtistRole>
    implements _$$_ArtistRoleCopyWith<$Res> {
  __$$_ArtistRoleCopyWithImpl(
      _$_ArtistRole _value, $Res Function(_$_ArtistRole) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? categories = freezed,
    Object? effectiveRoles = null,
    Object? roles = null,
    Object? artist = freezed,
  }) {
    return _then(_$_ArtistRole(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as String?,
      effectiveRoles: null == effectiveRoles
          ? _value.effectiveRoles
          : effectiveRoles // ignore: cast_nullable_to_non_nullable
              as String,
      roles: null == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as String,
      artist: freezed == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as Artist?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ArtistRole implements _ArtistRole {
  _$_ArtistRole(
      {this.id,
      this.name,
      this.categories,
      this.effectiveRoles = 'Default',
      this.roles = 'Default',
      this.artist});

  factory _$_ArtistRole.fromJson(Map<String, dynamic> json) =>
      _$$_ArtistRoleFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? categories;
  @override
  @JsonKey()
  final String effectiveRoles;
  @override
  @JsonKey()
  final String roles;
  @override
  final Artist? artist;

  @override
  String toString() {
    return 'ArtistRole(id: $id, name: $name, categories: $categories, effectiveRoles: $effectiveRoles, roles: $roles, artist: $artist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArtistRole &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.categories, categories) ||
                other.categories == categories) &&
            (identical(other.effectiveRoles, effectiveRoles) ||
                other.effectiveRoles == effectiveRoles) &&
            (identical(other.roles, roles) || other.roles == roles) &&
            (identical(other.artist, artist) || other.artist == artist));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, categories, effectiveRoles, roles, artist);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArtistRoleCopyWith<_$_ArtistRole> get copyWith =>
      __$$_ArtistRoleCopyWithImpl<_$_ArtistRole>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArtistRoleToJson(
      this,
    );
  }
}

abstract class _ArtistRole implements ArtistRole {
  factory _ArtistRole(
      {final int? id,
      final String? name,
      final String? categories,
      final String effectiveRoles,
      final String roles,
      final Artist? artist}) = _$_ArtistRole;

  factory _ArtistRole.fromJson(Map<String, dynamic> json) =
      _$_ArtistRole.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get categories;
  @override
  String get effectiveRoles;
  @override
  String get roles;
  @override
  Artist? get artist;
  @override
  @JsonKey(ignore: true)
  _$$_ArtistRoleCopyWith<_$_ArtistRole> get copyWith =>
      throw _privateConstructorUsedError;
}
