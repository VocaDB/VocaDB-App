import 'package:intl/intl.dart';
import 'package:vocadb/models/artist_event_model.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/models/release_event_series_model.dart';
import 'package:vocadb/utils/json_utils.dart';

class ReleaseEventModel extends EntryModel {
  EntryType entryType = EntryType.ReleaseEvent;
  String description;
  String category;
  String venueName;
  String date;
  String endDate;
  ReleaseEventSeriesModel series;
  List<ArtistEventModel> artists;

  ReleaseEventModel();

  ReleaseEventModel.fromJson(Map<String, dynamic> json)
      : description = json['description'],
        category = json['category'],
        venueName = json['venueName'],
        date = json['date'],
        endDate = json['endDate'],
        series = json.containsKey('series')
            ? ReleaseEventSeriesModel.fromJson(json['series'])
            : null,
        artists = JSONUtils.mapJsonArray<ArtistEventModel>(
            json['artists'], (v) => ArtistEventModel.fromJson(v)),
        super.fromJson(json);

  static List<ReleaseEventModel> jsonToList(List items) {
    return items.map((i) => ReleaseEventModel.fromJson(i)).toList();
  }

  String get displayCategory {
    return series?.category ?? category;
  }

  String get dateFormatted => (date == null)
      ? null
      : DateFormat('yyyy-MM-dd').format(DateTime.parse(date));
}
