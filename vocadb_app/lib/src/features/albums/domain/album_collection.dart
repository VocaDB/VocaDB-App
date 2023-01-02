// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  AlbumCollection copyWith({
    String? mediaType,
    String? purchaseStatus,
    int? rating,
    Album? album,
  }) {
    return AlbumCollection(
      mediaType: mediaType ?? this.mediaType,
      purchaseStatus: purchaseStatus ?? this.purchaseStatus,
      rating: rating ?? this.rating,
      album: album ?? this.album,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mediaType': mediaType,
      'purchaseStatus': purchaseStatus,
      'rating': rating,
      'album': album.toMap(),
    };
  }

  factory AlbumCollection.fromMap(Map<String, dynamic> map) {
    return AlbumCollection(
      mediaType: map['mediaType'] as String,
      purchaseStatus: map['purchaseStatus'] as String,
      rating: map['rating'] as int,
      album: Album.fromMap(map['album'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AlbumCollection.fromJson(String source) =>
      AlbumCollection.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AlbumCollection(mediaType: $mediaType, purchaseStatus: $purchaseStatus, rating: $rating, album: $album)';
  }

  @override
  bool operator ==(covariant AlbumCollection other) {
    if (identical(this, other)) return true;

    return other.mediaType == mediaType &&
        other.purchaseStatus == purchaseStatus &&
        other.rating == rating &&
        other.album == album;
  }

  @override
  int get hashCode {
    return mediaType.hashCode ^
        purchaseStatus.hashCode ^
        rating.hashCode ^
        album.hashCode;
  }
}
