import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MainPicture {
  String? mime;
  String? urlSmallThumb;
  String? urlThumb;
  String? urlTinyThumb;
  String? urlOriginal;
  MainPicture({
    this.mime,
    this.urlSmallThumb,
    this.urlThumb,
    this.urlTinyThumb,
    this.urlOriginal,
  });

  MainPicture copyWith({
    String? mime,
    String? urlSmallThumb,
    String? urlThumb,
    String? urlTinyThumb,
    String? urlOriginal,
  }) {
    return MainPicture(
      mime: mime ?? this.mime,
      urlSmallThumb: urlSmallThumb ?? this.urlSmallThumb,
      urlThumb: urlThumb ?? this.urlThumb,
      urlTinyThumb: urlTinyThumb ?? this.urlTinyThumb,
      urlOriginal: urlOriginal ?? this.urlOriginal,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mime': mime,
      'urlSmallThumb': urlSmallThumb,
      'urlThumb': urlThumb,
      'urlTinyThumb': urlTinyThumb,
      'urlOriginal': urlOriginal,
    };
  }

  factory MainPicture.fromMap(Map<String, dynamic> map) {
    return MainPicture(
      mime: map['mime'] != null ? map['mime'] as String : null,
      urlSmallThumb:
          map['urlSmallThumb'] != null ? map['urlSmallThumb'] as String : null,
      urlThumb: map['urlThumb'] != null ? map['urlThumb'] as String : null,
      urlTinyThumb:
          map['urlTinyThumb'] != null ? map['urlTinyThumb'] as String : null,
      urlOriginal:
          map['urlOriginal'] != null ? map['urlOriginal'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MainPicture.fromJson(String source) =>
      MainPicture.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MainPicture(mime: $mime, urlSmallThumb: $urlSmallThumb, urlThumb: $urlThumb, urlTinyThumb: $urlTinyThumb, urlOriginal: $urlOriginal)';
  }

  @override
  bool operator ==(covariant MainPicture other) {
    if (identical(this, other)) return true;

    return other.mime == mime &&
        other.urlSmallThumb == urlSmallThumb &&
        other.urlThumb == urlThumb &&
        other.urlTinyThumb == urlTinyThumb &&
        other.urlOriginal == urlOriginal;
  }

  @override
  int get hashCode {
    return mime.hashCode ^
        urlSmallThumb.hashCode ^
        urlThumb.hashCode ^
        urlTinyThumb.hashCode ^
        urlOriginal.hashCode;
  }
}
