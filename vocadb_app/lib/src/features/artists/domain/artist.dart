// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_link.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_relations.dart';
import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/tags/domain/tag_usage.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';

class Artist {
  final int id;

  final String? name;

  final String? additionalNames;

  final String? releaseDate;

  final String? imageUrl;

  final String? artistType;

  final String? description;

  final MainPicture? mainPicture;

  final ArtistRelations? relations;

  final Artist? baseVoicebank;

  final List<TagUsage>? tags;

  final List<WebLink>? webLinks;

  final List<ArtistLink>? artistLinksReverse;

  final List<ArtistLink>? artistLinks;

  Artist({
    required this.id,
    this.name,
    this.additionalNames,
    this.releaseDate,
    this.imageUrl,
    this.artistType,
    this.description,
    this.mainPicture,
    this.relations,
    this.baseVoicebank,
    this.tags = const [],
    this.webLinks = const [],
    this.artistLinksReverse = const [],
    this.artistLinks = const [],
  });
}

extension ArtistDateFormat on Artist {
  String? get releaseDateFormatted => (releaseDate == null)
      ? null
      : DateFormat('yyyy-MM-dd').format(DateTime.parse(releaseDate!));
}
