// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Lyric {
  const Lyric({
    required this.id,
    required this.cultureCode,
    required this.source,
    required this.translationType,
    required this.url,
    required this.value,
  });

  final int id;

  final String cultureCode;

  final String source;

  final String translationType;

  final String url;

  final String value;

  Lyric copyWith({
    int? id,
    String? cultureCode,
    String? source,
    String? translationType,
    String? url,
    String? value,
  }) {
    return Lyric(
      id: id ?? this.id,
      cultureCode: cultureCode ?? this.cultureCode,
      source: source ?? this.source,
      translationType: translationType ?? this.translationType,
      url: url ?? this.url,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cultureCode': cultureCode,
      'source': source,
      'translationType': translationType,
      'url': url,
      'value': value,
    };
  }

  factory Lyric.fromMap(Map<String, dynamic> map) {
    return Lyric(
      id: map['id'] as int,
      cultureCode: map['cultureCode'] as String,
      source: map['source'] as String,
      translationType: map['translationType'] as String,
      url: map['url'] as String,
      value: map['value'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Lyric.fromJson(String source) =>
      Lyric.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Lyric(id: $id, cultureCode: $cultureCode, source: $source, translationType: $translationType, url: $url, value: $value)';
  }

  @override
  bool operator ==(covariant Lyric other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.cultureCode == cultureCode &&
        other.source == source &&
        other.translationType == translationType &&
        other.url == url &&
        other.value == value;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        cultureCode.hashCode ^
        source.hashCode ^
        translationType.hashCode ^
        url.hashCode ^
        value.hashCode;
  }
}
