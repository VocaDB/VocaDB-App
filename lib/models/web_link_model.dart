import 'package:vocadb/models/base_model.dart';

class WebLinkModel extends BaseModel {
  
  int id;
  String description;
  String category;
  String url;

  WebLinkModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        description = json['description'],
        category = json['category'],
        url = json['url'],
        super.fromJson(json);

  static List<WebLinkModel> jsonToList(List items) {
    return items.map((i) => WebLinkModel.fromJson(i)).toList();
  }
}
