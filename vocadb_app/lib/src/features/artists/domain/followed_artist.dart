// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:vocadb_app/src/features/artists/domain/artist.dart';

class FollowedArtist {
  final int id;
  final Artist artist;

  const FollowedArtist({
    required this.id,
    required this.artist,
  });
}
