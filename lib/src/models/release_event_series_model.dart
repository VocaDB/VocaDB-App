import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/utils.dart';

class ReleaseEventSeriesModel extends EntryModel {
  EntryType entryType = EntryType.ReleaseEventSeries;
  String description;
  String category;
  String pictureMime;
  List<ReleaseEventModel> events;

  ReleaseEventSeriesModel();

  ReleaseEventSeriesModel.fromJson(Map<String, dynamic> json)
      : description = json['description'],
        category = json['category'],
        events = JSONUtils.mapJsonArray<ReleaseEventModel>(
            json['events'], (v) => ReleaseEventModel.fromJson(v)),
        super.fromJson(json);

  static List<ReleaseEventSeriesModel> jsonToList(List items) {
    return items.map((i) => ReleaseEventSeriesModel.fromJson(i)).toList();
  }
}
