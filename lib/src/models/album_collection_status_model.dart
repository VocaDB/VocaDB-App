import 'package:vocadb_app/models.dart';

class AlbumCollectionStatusModel {
  AlbumModel album;
  String mediaType;
  String purchaseStatus;
  int rating;

  AlbumCollectionStatusModel(
      {this.album, this.mediaType, this.purchaseStatus, this.rating});

  AlbumCollectionStatusModel.fromJson(Map<String, dynamic> json)
      : album = (json.containsKey('album'))
            ? AlbumModel.fromJson(json['album'])
            : null,
        mediaType = json['mediaType'],
        purchaseStatus = json['purchaseStatus'],
        rating = json['rating'];

  get label => (purchaseStatus != null) ? purchaseStatus : 'Add';

  get isCollected => (purchaseStatus != null && purchaseStatus != 'Nothing');
}
