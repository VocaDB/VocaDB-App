import 'package:vocadb/models/entry_model.dart';

class ReleaseEventSeriesModel extends EntryModel {
  EntryType entryType = EntryType.ReleaseEventSeries;
  String description;
  String category;
  String pictureMime;

  ReleaseEventSeriesModel();

  ReleaseEventSeriesModel.fromJson(Map<String, dynamic> json)
      : description = json['description'],
        category = json['category'],
        super.fromJson(json);

  static List<ReleaseEventSeriesModel> jsonToList(List items) {
    return items.map((i) => ReleaseEventSeriesModel.fromJson(i)).toList();
  }
}
 