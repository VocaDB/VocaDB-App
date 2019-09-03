import 'package:flutter/material.dart';
import 'package:vocadb/widgets/song_tile.dart';
import 'package:vocadb/widgets/album_tile.dart';
import 'package:vocadb/widgets/artist_tile.dart';

class EntryTile extends StatelessWidget {
  final Map<String, Object> entry;

  const EntryTile(Map<String, Object> entry) : this.entry = entry;

  getThumbnailUrl() {
    Map<String, Object> mainPicture = entry["mainPicture"];

    return mainPicture["urlThumb"];
  }

  @override
  Widget build(BuildContext context) {

    switch (entry["entryType"]) {
      case "Song":
        return SongTile(name: entry["name"], artist: entry["artistString"], imageUrl: getThumbnailUrl());
      case "Album":
        return AlbumTile(name: entry["name"], artist: entry["artistString"], imageUrl: getThumbnailUrl());
      case "Artist":
        return ArtistTile(name: entry["name"], type: entry["artistType"], imageUrl: getThumbnailUrl());

      default:
        return ListTile(
          leading: SizedBox(
            width: 50,
            height: 50,
            child: Image.network(
              getThumbnailUrl(),
              fit: BoxFit.fill,
            ),
          ),
          title: Text(entry["name"], overflow: TextOverflow.ellipsis),
        );
    }
  }
}