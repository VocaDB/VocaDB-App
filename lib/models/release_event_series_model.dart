import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/models/release_event_model.dart';
import 'package:vocadb/utils/json_utils.dart';

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
 