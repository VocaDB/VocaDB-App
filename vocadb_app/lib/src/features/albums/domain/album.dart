// ignore_for_file: public_member_api_docs, sort_constructors_first
// TODO : need more implementation detail
import 'package:vocadb_app/src/features/albums/domain/track.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_role.dart';
import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/pvs/domain/pv.dart';
import 'package:vocadb_app/src/features/tags/domain/tag_usage.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';

class Album {
  final int id;

  final String? name;

  final String? artistString;

  final String? imageUrl;

  final String? discType;

  final String? catalogNumber;

  final String? description;

  final List<Disc>? discs;

  final MainPicture? mainPicture;

  final List<ArtistRole>? artists;

  final List<PV>? pvs;

  final double? ratingAverage;

  final int? ratingCount;

  final ReleaseDate? releaseDate;

  final List<TagUsage>? tags;

  final List<Track>? tracks;

  final List<WebLink>? webLinks;
  Album({
    required this.id,
    this.name,
    this.artistString,
    this.imageUrl,
    this.discType,
    this.catalogNumber,
    this.description,
    this.discs,
    this.mainPicture,
    this.artists,
    this.pvs,
    this.ratingAverage,
    this.ratingCount,
    this.releaseDate,
    this.tags,
    this.tracks,
    this.webLinks,
  });
}

class ReleaseDate {
  final int day;
  final String formatted;
  final int month;
  final int year;
  ReleaseDate({
    required this.day,
    required this.formatted,
    required this.month,
    required this.year,
  });
}

class Disc {
  final int id;
  final int discNumber;
  final String mediaType;
  final String name;
  Disc({
    required this.id,
    required this.discNumber,
    required this.mediaType,
    required this.name,
  });
}
