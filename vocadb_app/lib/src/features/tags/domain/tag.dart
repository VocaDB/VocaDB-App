// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Tag {
  const Tag({
    required this.id,
    required this.name,
    required this.categoryName,
  });

  final String id;

  final String name;

  final String categoryName;

  Tag copyWith({
    String? id,
    String? name,
    String? categoryName,
  }) {
    return Tag(
      id: id ?? this.id,
      name: name ?? this.name,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'categoryName': categoryName,
    };
  }

  factory Tag.fromMap(Map<String, dynamic> map) {
    return Tag(
      id: map['id'] as String,
      name: map['name'] as String,
      categoryName: map['categoryName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tag.fromJson(String source) =>
      Tag.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Tag(id: $id, name: $name, categoryName: $categoryName)';

  @override
  bool operator ==(covariant Tag other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.categoryName == categoryName;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ categoryName.hashCode;
}
