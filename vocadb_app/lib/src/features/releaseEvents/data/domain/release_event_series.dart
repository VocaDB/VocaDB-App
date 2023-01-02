// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/domain/release_event.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'release_event_series.freezed.dart';
part 'release_event_series.g.dart';

@freezed
class ReleaseEventSeries with _$ReleaseEventSeries {
  factory ReleaseEventSeries({
    required int id,
    String? name,
    String? additionalNames,
    String? description,
    String? category,
    @Default([]) List<ReleaseEvent> events,
    MainPicture? mainPicture,
    @Default([]) List<WebLink> webLinks,
  }) = _ReleaseEventSeries;

  factory ReleaseEventSeries.fromJson(Map<String, dynamic> json) =>
      _$ReleaseEventSeriesFromJson(json);
}
