import 'package:intl/intl.dart';
import 'package:vocadb/models/artist_event_model.dart';
import 'package:vocadb/models/base_model.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/utils/json_utils.dart';

class ReleaseEventSeriesModel extends EntryModel {
  EntryType entryType = EntryType.ReleaseEventSeries;
  String description;
  String category;

  ReleaseEventSeriesModel();

  ReleaseEventSeriesModel.fromJson(Map<String, dynamic> json)
      : description = json['description'],
        category = json['category'],
        super.fromJson(json);

  static List<ReleaseEventSeriesModel> jsonToList(List items) {
    return items.map((i) => ReleaseEventSeriesModel.fromJson(i)).toList();
  }
}
