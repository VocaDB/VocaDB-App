class PVModel {
  int id;
  String name;
  String service;
  String url;
  String pvType;

  PVModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        service = json['service'],
        pvType = json['pvType'],
        url = json['url'];
}
