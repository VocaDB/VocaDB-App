import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_role.dart';
import 'package:vocadb_app/src/features/pvs/domain/pv.dart';
import 'package:vocadb_app/src/features/songs/domain/lyric.dart';
import 'package:vocadb_app/src/features/tags/domain/tag_usage.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';

class Song {
  const Song({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.artistString,
    required this.songType,
    this.pvServices = '',
    this.additionalNames = '',
    this.favoritedTimes = 0,
    this.lengthSeconds = 0,
    this.createDate = '',
    this.publishDate = '',
    this.ratingScore = 0,
    this.tagUsages = const [],
    this.artistRoles = const [],
    this.albums = const [],
    this.lyrics = const [],
    this.pvs = const [],
    this.webLinks = const [],
  });

  final String id;

  final String name;

  final String artistString;

  final String imageUrl;

  final String songType;

  final String pvServices;

  final String additionalNames;

  final String createDate;

  final int favoritedTimes;

  final int lengthSeconds;

  final String publishDate;

  final int ratingScore;

  final List<TagUsage> tagUsages;

  final List<ArtistRole> artistRoles;

  final List<Album> albums;

  final List<Lyric> lyrics;

  final List<PV> pvs;

  final List<WebLink> webLinks;
}

extension SongPV on Song {
  String get pvSearchQuery =>
      (pvs.isNotEmpty) ? pvs[0].name : '$artistString+$name';
}
