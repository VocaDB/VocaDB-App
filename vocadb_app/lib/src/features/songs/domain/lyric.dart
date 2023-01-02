import 'package:freezed_annotation/freezed_annotation.dart';

part 'lyric.freezed.dart';
part 'lyric.g.dart';

@freezed
class Lyric with _$Lyric {
  factory Lyric({
    required int id,
    String? cultureCode,
    String? source,
    String? translationType,
    String? url,
    String? value,
  }) = _Lyric;

  factory Lyric.fromJson(Map<String, dynamic> json) => _$LyricFromJson(json);
}
