import 'package:intl/intl.dart';
import 'package:vocadb_app/constants.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/utils.dart';

class ReleaseEventModel extends EntryModel {
  EntryType entryType = EntryType.ReleaseEvent;
  String description;
  String category;
  String venueName;
  DateTime date;
  DateTime endDate;
  ReleaseEventSeriesModel series;
  List<ArtistEventModel> artists;

  ReleaseEventModel({
    int id,
    String name,
    String eventCategory,
    MainPictureModel mainPicture,
  }) : super(
            id: id,
            name: name,
            eventCategory: eventCategory,
            mainPicture: mainPicture,
            entryType: EntryType.ReleaseEvent);

  ReleaseEventModel.fromJson(Map<String, dynamic> json)
      : description = json['description'],
        category = json['category'],
        venueName = json['venueName'],
        date = json.containsKey('date') ? DateTime.parse(json['date']) : null,
        endDate = json.containsKey('endDate')
            ? DateTime.parse(json['endDate'])
            : null,
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

  String get dateFormatted =>
      (date == null) ? null : DateFormat('yyyy-MM-dd').format(date);

  String get originUrl => '$baseUrl/E/${this.id}';
}
