// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:vocadb_app/src/features/albums/domain/album.dart';

class AlbumCollection {
  final String mediaType;
  final String purchaseStatus;
  final int rating;
  final Album album;
  AlbumCollection({
    required this.mediaType,
    required this.purchaseStatus,
    required this.rating,
    required this.album,
  });
}
