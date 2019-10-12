import 'package:vocadb/models/entry_model.dart';

class ReleaseEventModel extends EntryModel {
  EntryType entryType = EntryType.ReleaseEvent;
  String description;
  String category;
  String venueName;
  String date;
  String endDate;

  ReleaseEventModel();

  ReleaseEventModel.fromJson(Map<String, dynamic> json)
      : description = json['description'],
        category = json['category'],
        venueName = json['venueName'],
        date = json['date'],
        endDate = json['endDate'],
        super.fromJson(json);

  static List<ReleaseEventModel> jsonToList(List items) {
    return items.map((i) => ReleaseEventModel.fromJson(i)).toList();
  }
}
