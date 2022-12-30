// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WebLink {
  final String id;
  final String description;
  final String category;
  final String url;

  const WebLink({
    required this.id,
    required this.description,
    required this.category,
    required this.url,
  });

  WebLink copyWith({
    String? id,
    String? description,
    String? category,
    String? url,
  }) {
    return WebLink(
      id: id ?? this.id,
      description: description ?? this.description,
      category: category ?? this.category,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'category': category,
      'url': url,
    };
  }

  factory WebLink.fromMap(Map<String, dynamic> map) {
    return WebLink(
      id: map['id'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WebLink.fromJson(String source) =>
      WebLink.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WebLink(id: $id, description: $description, category: $category, url: $url)';
  }

  @override
  bool operator ==(covariant WebLink other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.description == description &&
        other.category == category &&
        other.url == url;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        description.hashCode ^
        category.hashCode ^
        url.hashCode;
  }
}
