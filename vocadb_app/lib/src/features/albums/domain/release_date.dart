import 'package:freezed_annotation/freezed_annotation.dart';

part 'release_date.freezed.dart';
part 'release_date.g.dart';

@freezed
class ReleaseDate with _$ReleaseDate {
  factory ReleaseDate({
    required int day,
    required String formatted,
    required int month,
    required int year,
  }) = _ReleaseDate;

  factory ReleaseDate.fromJson(Map<String, dynamic> json) =>
      _$ReleaseDateFromJson(json);
}
