import 'package:vocadb_app/models.dart';

class PVPlayListArgs {
  final String title;

  final List<SongModel> songs;

  const PVPlayListArgs({this.songs, this.title = 'Playlist'});
}
