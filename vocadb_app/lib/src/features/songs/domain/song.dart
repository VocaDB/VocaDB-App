import 'package:vocadb_app/src/features/tags/domain/tag_usage.dart';

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
}
