import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vocadb/blocs/favorite_album_bloc.dart';
import 'package:vocadb/blocs/favorite_artist_bloc.dart';
import 'package:vocadb/blocs/favorite_song_bloc.dart';
import 'package:vocadb/models/profile_model.dart';

class ProfileBloc {
  final FavoriteSongBloc favoriteSongBloc;
  final FavoriteAlbumBloc favoriteAlbumBloc;
  final FavoriteArtistBloc favoriteArtistBloc;

  ProfileBloc(
      {this.favoriteSongBloc, this.favoriteAlbumBloc, this.favoriteArtistBloc});

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/vocadb_my_profile.json');
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<void> exportProfile() async {
    final file = await _localFile;

    ProfileModel profileModel = ProfileModel();
    profileModel.favoriteSongs = favoriteSongBloc.songList;
    profileModel.followedArtists = favoriteArtistBloc.artistList;
    profileModel.favoriteAlbums = favoriteAlbumBloc.albumList;

    String jsonEncoded = json.encode(profileModel.toJson());

    file.writeAsString(jsonEncoded);

    Uint8List bytes = await file.readAsBytes();

    String title = 'my_vocadb_profile';

    return Share.file(title, '$title.json', bytes, 'application/json');
  }

  Future<void> importProfile() async {
    File file = await FilePicker.getFile(type: FileType.ANY);

    if (file == null) {
      throw ("No file selected");
    }

    String content = await file.readAsString();

    if (content == null || content.isEmpty) {
      throw ("Invalid file content.");
    }

    Map<String, dynamic> jsonDecoded = json.decode(content);

    if (jsonDecoded.containsKey('favoriteSongs') &&
        jsonDecoded.containsKey('followedArtists') &&
        jsonDecoded.containsKey('favoriteAlbums')) {
      final profileModel = ProfileModel.fromJson(jsonDecoded);
      favoriteSongBloc.update(profileModel.favoriteSongs);
      favoriteArtistBloc.update(profileModel.followedArtists);
      favoriteAlbumBloc.update(profileModel.favoriteAlbums);
    } else {
      throw ("Invalid file content.");
    }
  }
}
