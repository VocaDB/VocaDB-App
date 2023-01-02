// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'web_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WebLink _$WebLinkFromJson(Map<String, dynamic> json) {
  return _WebLink.fromJson(json);
}

/// @nodoc
mixin _$WebLink {
  int get id => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WebLinkCopyWith<WebLink> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebLinkCopyWith<$Res> {
  factory $WebLinkCopyWith(WebLink value, $Res Function(WebLink) then) =
      _$WebLinkCopyWithImpl<$Res, WebLink>;
  @useResult
  $Res call({int id, String? description, String? category, String? url});
}

/// @nodoc
class _$WebLinkCopyWithImpl<$Res, $Val extends WebLink>
    implements $WebLinkCopyWith<$Res> {
  _$WebLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = freezed,
    Object? category = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WebLinkCopyWith<$Res> implements $WebLinkCopyWith<$Res> {
  factory _$$_WebLinkCopyWith(
          _$_WebLink value, $Res Function(_$_WebLink) then) =
      __$$_WebLinkCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String? description, String? category, String? url});
}

/// @nodoc
class __$$_WebLinkCopyWithImpl<$Res>
    extends _$WebLinkCopyWithImpl<$Res, _$_WebLink>
    implements _$$_WebLinkCopyWith<$Res> {
  __$$_WebLinkCopyWithImpl(_$_WebLink _value, $Res Function(_$_WebLink) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = freezed,
    Object? category = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_WebLink(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WebLink implements _WebLink {
  const _$_WebLink(
      {required this.id, this.description, this.category, this.url});

  factory _$_WebLink.fromJson(Map<String, dynamic> json) =>
      _$$_WebLinkFromJson(json);

  @override
  final int id;
  @override
  final String? description;
  @override
  final String? category;
  @override
  final String? url;

  @override
  String toString() {
    return 'WebLink(id: $id, description: $description, category: $category, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WebLink &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, description, category, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WebLinkCopyWith<_$_WebLink> get copyWith =>
      __$$_WebLinkCopyWithImpl<_$_WebLink>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WebLinkToJson(
      this,
    );
  }
}

abstract class _WebLink implements WebLink {
  const factory _WebLink(
      {required final int id,
      final String? description,
      final String? category,
      final String? url}) = _$_WebLink;

  factory _WebLink.fromJson(Map<String, dynamic> json) = _$_WebLink.fromJson;

  @override
  int get id;
  @override
  String? get description;
  @override
  String? get category;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$_WebLinkCopyWith<_$_WebLink> get copyWith =>
      throw _privateConstructorUsedError;
}
