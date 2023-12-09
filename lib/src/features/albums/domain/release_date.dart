import 'package:freezed_annotation/freezed_annotation.dart';

part 'release_date.freezed.dart';
part 'release_date.g.dart';

@freezed
class ReleaseDate with _$ReleaseDate {
  factory ReleaseDate({
    @Default(0) int day,
    @Default('') String formatted,
    @Default(0) int month,
    @Default(0) int year,
  }) = _ReleaseDate;

  factory ReleaseDate.fromJson(Map<String, dynamic> json) =>
      _$ReleaseDateFromJson(json);
}
