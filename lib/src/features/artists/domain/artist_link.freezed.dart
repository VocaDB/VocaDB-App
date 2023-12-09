// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'artist_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArtistLink _$ArtistLinkFromJson(Map<String, dynamic> json) {
  return _ArtistLink.fromJson(json);
}

/// @nodoc
mixin _$ArtistLink {
  String get linkType => throw _privateConstructorUsedError;
  Artist get artist => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtistLinkCopyWith<ArtistLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistLinkCopyWith<$Res> {
  factory $ArtistLinkCopyWith(
          ArtistLink value, $Res Function(ArtistLink) then) =
      _$ArtistLinkCopyWithImpl<$Res, ArtistLink>;
  @useResult
  $Res call({String linkType, Artist artist});

  $ArtistCopyWith<$Res> get artist;
}

/// @nodoc
class _$ArtistLinkCopyWithImpl<$Res, $Val extends ArtistLink>
    implements $ArtistLinkCopyWith<$Res> {
  _$ArtistLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? linkType = null,
    Object? artist = null,
  }) {
    return _then(_value.copyWith(
      linkType: null == linkType
          ? _value.linkType
          : linkType // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as Artist,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ArtistCopyWith<$Res> get artist {
    return $ArtistCopyWith<$Res>(_value.artist, (value) {
      return _then(_value.copyWith(artist: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ArtistLinkCopyWith<$Res>
    implements $ArtistLinkCopyWith<$Res> {
  factory _$$_ArtistLinkCopyWith(
          _$_ArtistLink value, $Res Function(_$_ArtistLink) then) =
      __$$_ArtistLinkCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String linkType, Artist artist});

  @override
  $ArtistCopyWith<$Res> get artist;
}

/// @nodoc
class __$$_ArtistLinkCopyWithImpl<$Res>
    extends _$ArtistLinkCopyWithImpl<$Res, _$_ArtistLink>
    implements _$$_ArtistLinkCopyWith<$Res> {
  __$$_ArtistLinkCopyWithImpl(
      _$_ArtistLink _value, $Res Function(_$_ArtistLink) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? linkType = null,
    Object? artist = null,
  }) {
    return _then(_$_ArtistLink(
      linkType: null == linkType
          ? _value.linkType
          : linkType // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as Artist,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ArtistLink implements _ArtistLink {
  _$_ArtistLink({required this.linkType, required this.artist});

  factory _$_ArtistLink.fromJson(Map<String, dynamic> json) =>
      _$$_ArtistLinkFromJson(json);

  @override
  final String linkType;
  @override
  final Artist artist;

  @override
  String toString() {
    return 'ArtistLink(linkType: $linkType, artist: $artist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArtistLink &&
            (identical(other.linkType, linkType) ||
                other.linkType == linkType) &&
            (identical(other.artist, artist) || other.artist == artist));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, linkType, artist);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArtistLinkCopyWith<_$_ArtistLink> get copyWith =>
      __$$_ArtistLinkCopyWithImpl<_$_ArtistLink>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArtistLinkToJson(
      this,
    );
  }
}

abstract class _ArtistLink implements ArtistLink {
  factory _ArtistLink(
      {required final String linkType,
      required final Artist artist}) = _$_ArtistLink;

  factory _ArtistLink.fromJson(Map<String, dynamic> json) =
      _$_ArtistLink.fromJson;

  @override
  String get linkType;
  @override
  Artist get artist;
  @override
  @JsonKey(ignore: true)
  _$$_ArtistLinkCopyWith<_$_ArtistLink> get copyWith =>
      throw _privateConstructorUsedError;
}
