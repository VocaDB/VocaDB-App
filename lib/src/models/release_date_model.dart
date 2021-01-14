import 'package:vocadb_app/models.dart';

class ReleaseDateModel extends BaseModel {
  int day;
  String formatted;
  int mouth;
  int year;

  ReleaseDateModel.fromJson(Map<String, dynamic> json)
      : day = json['day'],
        formatted = json['formatted'],
        mouth = json['mouth'],
        year = json['year'];
}
