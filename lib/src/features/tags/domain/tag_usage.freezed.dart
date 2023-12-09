// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tag_usage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TagUsage _$TagUsageFromJson(Map<String, dynamic> json) {
  return _TagUsage.fromJson(json);
}

/// @nodoc
mixin _$TagUsage {
  int get count => throw _privateConstructorUsedError;
  Tag get tag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagUsageCopyWith<TagUsage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagUsageCopyWith<$Res> {
  factory $TagUsageCopyWith(TagUsage value, $Res Function(TagUsage) then) =
      _$TagUsageCopyWithImpl<$Res, TagUsage>;
  @useResult
  $Res call({int count, Tag tag});

  $TagCopyWith<$Res> get tag;
}

/// @nodoc
class _$TagUsageCopyWithImpl<$Res, $Val extends TagUsage>
    implements $TagUsageCopyWith<$Res> {
  _$TagUsageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? tag = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as Tag,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TagCopyWith<$Res> get tag {
    return $TagCopyWith<$Res>(_value.tag, (value) {
      return _then(_value.copyWith(tag: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TagUsageCopyWith<$Res> implements $TagUsageCopyWith<$Res> {
  factory _$$_TagUsageCopyWith(
          _$_TagUsage value, $Res Function(_$_TagUsage) then) =
      __$$_TagUsageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, Tag tag});

  @override
  $TagCopyWith<$Res> get tag;
}

/// @nodoc
class __$$_TagUsageCopyWithImpl<$Res>
    extends _$TagUsageCopyWithImpl<$Res, _$_TagUsage>
    implements _$$_TagUsageCopyWith<$Res> {
  __$$_TagUsageCopyWithImpl(
      _$_TagUsage _value, $Res Function(_$_TagUsage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? tag = null,
  }) {
    return _then(_$_TagUsage(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as Tag,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TagUsage implements _TagUsage {
  _$_TagUsage({this.count = 0, required this.tag});

  factory _$_TagUsage.fromJson(Map<String, dynamic> json) =>
      _$$_TagUsageFromJson(json);

  @override
  @JsonKey()
  final int count;
  @override
  final Tag tag;

  @override
  String toString() {
    return 'TagUsage(count: $count, tag: $tag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TagUsage &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, tag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TagUsageCopyWith<_$_TagUsage> get copyWith =>
      __$$_TagUsageCopyWithImpl<_$_TagUsage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TagUsageToJson(
      this,
    );
  }
}

abstract class _TagUsage implements TagUsage {
  factory _TagUsage({final int count, required final Tag tag}) = _$_TagUsage;

  factory _TagUsage.fromJson(Map<String, dynamic> json) = _$_TagUsage.fromJson;

  @override
  int get count;
  @override
  Tag get tag;
  @override
  @JsonKey(ignore: true)
  _$$_TagUsageCopyWith<_$_TagUsage> get copyWith =>
      throw _privateConstructorUsedError;
}
