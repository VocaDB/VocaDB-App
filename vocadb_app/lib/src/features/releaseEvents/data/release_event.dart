// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_role.dart';
import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/release_event_series.dart';
import 'package:vocadb_app/src/features/tags/domain/tag_usage.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';

class ReleaseEvent {
  final int id;

  final String? name;

  final String? additionalNames;

  final String? description;

  final DateTime? date;

  final DateTime? endDate;

  final String? imageUrl;

  final String? category;

  final String? venueName;

  final MainPicture? mainPicture;

  final List<ArtistRole>? artists;

  final ReleaseEventSeries? series;

  final List<TagUsage>? tags;

  final List<WebLink>? webLinks;

  ReleaseEvent({
    required this.id,
    this.name,
    this.additionalNames,
    this.description,
    this.date,
    this.endDate,
    this.imageUrl,
    this.category,
    this.venueName,
    this.mainPicture,
    this.artists,
    this.series,
    this.webLinks,
    this.tags,
  });
}

extension ReleaseEventExtended on ReleaseEvent {
  String? get displayCategory {
    return series?.category ?? category ?? '<None>';
  }

  String? get dateFormatted =>
      (date == null) ? null : DateFormat('yyyy-MM-dd').format(date!);
}
