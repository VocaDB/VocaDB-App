import 'package:vocadb_app/models.dart';

class LyricModel extends BaseModel {
  int id;
  String translationType;
  String cultureCode;
  String value;

  LyricModel({this.id, this.translationType, this.cultureCode, this.value});

  LyricModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        translationType = json['translationType'],
        cultureCode = json['cultureCode'],
        value = json['value'];
}

class LyricList {
  final List<LyricModel> lyrics;

  LyricList(this.lyrics);

  List<String> get translationTypes =>
      lyrics.map<String>((l) => l.translationType).toList();
}
