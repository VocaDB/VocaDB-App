import 'package:vocadb_app/src/features/artists/domain/artist.dart';

class ArtistRole {
  const ArtistRole({
    required this.id,
    required this.name,
    required this.categories,
    this.effectiveRoles = 'Default',
    this.roles = 'Default',
    required this.artist,
  });

  final int id;

  final String name;

  final String categories;

  final String effectiveRoles;

  final String roles;

  final Artist artist;

  String get artistRole =>
      (categories == 'Other') ? effectiveRoles : categories;

  bool get isProducer => (categories == 'Producer');

  bool get isVocalist => (categories == 'Vocalist');

  bool get isOtherRole => (!isProducer && !isVocalist);
}
