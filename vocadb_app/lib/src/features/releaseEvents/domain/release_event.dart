import 'package:intl/intl.dart';

import 'package:vocadb_app/src/features/artists/domain/artist_role.dart';
import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event_series.dart';
import 'package:vocadb_app/src/features/tags/domain/tag_usage.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'release_event.freezed.dart';
part 'release_event.g.dart';

@freezed
class ReleaseEvent with _$ReleaseEvent {
  factory ReleaseEvent({
    required int id,
    String? name,
    String? additionalNames,
    String? description,
    DateTime? date,
    DateTime? endDate,
    String? imageUrl,
    String? category,
    String? venueName,
    MainPicture? mainPicture,
    @Default([]) List<ArtistRole>? artists,
    ReleaseEventSeries? series,
    @Default([]) List<TagUsage>? tags,
    @Default([]) List<WebLink> webLinks,
  }) = _ReleaseEvent;

  factory ReleaseEvent.fromJson(Map<String, dynamic> json) =>
      _$ReleaseEventFromJson(json);

  static List<ReleaseEvent> fromJsonToList(List<dynamic> source) {
    return source.map((e) => ReleaseEvent.fromJson(e)).toList();
  }
}

extension ReleaseEventExtended on ReleaseEvent {
  String? get displayCategory {
    return series?.category ?? category ?? '<None>';
  }

  String? get dateFormatted =>
      (date == null) ? null : DateFormat('yyyy-MM-dd').format(date!);
}
