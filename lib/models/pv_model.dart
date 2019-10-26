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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'service': service,
      'url': url,
      'pvType': pvType,
    };
  }

  String toString() {
    return toJson().toString();
  }
}

class PVList {
  final List<PVModel> pvs;

  PVList(this.pvs);

  bool get isContainsYoutube =>
      pvs.firstWhere((pv) => pv.service.toLowerCase() == "youtube",
          orElse: () => null) !=
      null;

  List<PVModel> get originalPVs =>
      pvs.where((pv) => pv.pvType == 'Original').toList();

  List<PVModel> get otherPVs =>
      pvs.where((pv) => pv.pvType != 'Original').toList();
}
