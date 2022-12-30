// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MainPicture {
  String meme;
  String urlSmallThumb;
  String urlThumb;
  String urlTinyThumb;
  MainPicture({
    required this.meme,
    required this.urlSmallThumb,
    required this.urlThumb,
    required this.urlTinyThumb,
  });

  MainPicture copyWith({
    String? meme,
    String? urlSmallThumb,
    String? urlThumb,
    String? urlTinyThumb,
  }) {
    return MainPicture(
      meme: meme ?? this.meme,
      urlSmallThumb: urlSmallThumb ?? this.urlSmallThumb,
      urlThumb: urlThumb ?? this.urlThumb,
      urlTinyThumb: urlTinyThumb ?? this.urlTinyThumb,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'meme': meme,
      'urlSmallThumb': urlSmallThumb,
      'urlThumb': urlThumb,
      'urlTinyThumb': urlTinyThumb,
    };
  }

  factory MainPicture.fromMap(Map<String, dynamic> map) {
    return MainPicture(
      meme: map['meme'] as String,
      urlSmallThumb: map['urlSmallThumb'] as String,
      urlThumb: map['urlThumb'] as String,
      urlTinyThumb: map['urlTinyThumb'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MainPicture.fromJson(String source) =>
      MainPicture.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MainPicture(meme: $meme, urlSmallThumb: $urlSmallThumb, urlThumb: $urlThumb, urlTinyThumb: $urlTinyThumb)';
  }

  @override
  bool operator ==(covariant MainPicture other) {
    if (identical(this, other)) return true;

    return other.meme == meme &&
        other.urlSmallThumb == urlSmallThumb &&
        other.urlThumb == urlThumb &&
        other.urlTinyThumb == urlTinyThumb;
  }

  @override
  int get hashCode {
    return meme.hashCode ^
        urlSmallThumb.hashCode ^
        urlThumb.hashCode ^
        urlTinyThumb.hashCode;
  }
}
