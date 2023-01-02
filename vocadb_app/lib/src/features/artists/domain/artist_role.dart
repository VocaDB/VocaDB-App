// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:vocadb_app/src/features/artists/domain/artist.dart';

class ArtistRole {
  const ArtistRole({
    this.id,
    this.name,
    this.categories,
    this.effectiveRoles = 'Default',
    this.roles = 'Default',
    required this.artist,
  });

  final int? id;

  final String? name;

  final String? categories;

  final String? effectiveRoles;

  final String? roles;

  final Artist artist;

  ArtistRole copyWith({
    int? id,
    String? name,
    String? categories,
    String? effectiveRoles,
    String? roles,
    Artist? artist,
  }) {
    return ArtistRole(
      id: id ?? this.id,
      name: name ?? this.name,
      categories: categories ?? this.categories,
      effectiveRoles: effectiveRoles ?? this.effectiveRoles,
      roles: roles ?? this.roles,
      artist: artist ?? this.artist,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'categories': categories,
      'effectiveRoles': effectiveRoles,
      'roles': roles,
      'artist': artist.toMap(),
    };
  }

  factory ArtistRole.fromMap(Map<String, dynamic> map) {
    return ArtistRole(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      categories:
          map['categories'] != null ? map['categories'] as String : null,
      effectiveRoles: map['effectiveRoles'] != null
          ? map['effectiveRoles'] as String
          : null,
      roles: map['roles'] != null ? map['roles'] as String : null,
      artist: Artist.fromMap(map['artist'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ArtistRole.fromJson(String source) =>
      ArtistRole.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ArtistRole(id: $id, name: $name, categories: $categories, effectiveRoles: $effectiveRoles, roles: $roles, artist: $artist)';
  }

  @override
  bool operator ==(covariant ArtistRole other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.categories == categories &&
        other.effectiveRoles == effectiveRoles &&
        other.roles == roles &&
        other.artist == artist;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        categories.hashCode ^
        effectiveRoles.hashCode ^
        roles.hashCode ^
        artist.hashCode;
  }
}

extension ArtistRoleExtended on ArtistRole {
  String get artistRole =>
      (categories! == 'Other') ? effectiveRoles! : categories!;

  bool get isProducer => (categories == 'Producer');

  bool get isVocalist => (categories == 'Vocalist');

  bool get isCircle => (categories == 'Circle');

  bool get isLabel => (categories == 'Label');

  bool get isOtherRole => (!isProducer && !isVocalist);
}

extension ArtistsByRole on List<ArtistRole> {
  List<ArtistRole> get producers => where((e) => e.isProducer).toList();
  List<ArtistRole> get vocalists => where((e) => e.isVocalist).toList();
  List<ArtistRole> get circles => where((e) => e.isVocalist).toList();
  List<ArtistRole> get labels => where((e) => e.isLabel).toList();
}
