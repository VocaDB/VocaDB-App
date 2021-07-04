import 'package:equatable/equatable.dart';

class PVModel extends Equatable {
  int id;
  String name;
  String service;
  String url;
  String pvType;
  int length;

  @override
  List<Object> get props => [id, name, service, url, pvType, length];

  PVModel(
      {this.id, this.name, this.service, this.url, this.pvType, this.length});

  PVModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        service = json['service'],
        pvType = json['pvType'],
        length = json['length'],
        url = json['url'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'service': service,
      'url': url,
      'length': length,
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
