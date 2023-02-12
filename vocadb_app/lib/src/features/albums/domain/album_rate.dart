import 'package:freezed_annotation/freezed_annotation.dart';

part 'album_rate.freezed.dart';
part 'album_rate.g.dart';

@freezed
class AlbumRate with _$AlbumRate {
  const factory AlbumRate({
    @Default('Nothing') String collectionStatus,
    required String mediaType,
    required int rating,
  }) = _AlbumRate;

  factory AlbumRate.fromJson(Map<String, dynamic> json) =>
      _$AlbumRateFromJson(json);
}
