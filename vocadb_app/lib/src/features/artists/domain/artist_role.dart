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
