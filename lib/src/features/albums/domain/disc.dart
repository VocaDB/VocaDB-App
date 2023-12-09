import 'package:freezed_annotation/freezed_annotation.dart';

part 'disc.freezed.dart';
part 'disc.g.dart';

@freezed
class Disc with _$Disc {
  factory Disc({
    int? id,
    int? discNumber,
    String? mediaType,
    String? name,
  }) = _Disc;

  factory Disc.fromJson(Map<String, dynamic> json) => _$DiscFromJson(json);
}
