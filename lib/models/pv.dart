class PV {
  int id;
  String name;
  String service;
  String url;

  PV.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    name = json['name'],
    service = json['service'],
    url = json['url'];
}