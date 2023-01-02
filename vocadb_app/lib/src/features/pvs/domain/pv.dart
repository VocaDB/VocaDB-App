// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PV {
  const PV({
    required this.id,
    required this.name,
    required this.service,
    required this.pvType,
    required this.url,
  });

  final int id;

  final String name;

  final String service;

  final String pvType;

  final String url;

  PV copyWith({
    int? id,
    String? name,
    String? service,
    String? pvType,
    String? url,
  }) {
    return PV(
      id: id ?? this.id,
      name: name ?? this.name,
      service: service ?? this.service,
      pvType: pvType ?? this.pvType,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'service': service,
      'pvType': pvType,
      'url': url,
    };
  }

  factory PV.fromMap(Map<String, dynamic> map) {
    return PV(
      id: map['id'] as int,
      name: map['name'] as String,
      service: map['service'] as String,
      pvType: map['pvType'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PV.fromJson(String source) =>
      PV.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PV(id: $id, name: $name, service: $service, pvType: $pvType, url: $url)';
  }

  @override
  bool operator ==(covariant PV other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.service == service &&
        other.pvType == pvType &&
        other.url == url;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        service.hashCode ^
        pvType.hashCode ^
        url.hashCode;
  }
}
