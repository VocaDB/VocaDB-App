import 'package:get/get.dart';
import 'package:vocadb_app/arguments.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';

class TagDetailController extends GetxController {
  final tag = TagModel().obs;
  final latestSongs = <SongModel>[].obs;
  final topSongs = <SongModel>[].obs;
  final topArtists = <ArtistModel>[].obs;
  final topAlbums = <AlbumModel>[].obs;

  final TagRepository tagRepository;
  final SongRepository songRepository;
  final ArtistRepository artistRepository;
  final AlbumRepository albumRepository;

  TagDetailController(
      {this.tagRepository,
      this.songRepository,
      this.artistRepository,
      this.albumRepository});

  @override
  void onInit() {
    initArgs();
    fetchApis();
    super.onInit();
  }

  initArgs() {
    TagDetailArgs args = Get.arguments;

    if (args.tag != null) {
      tag(args.tag);
    } else {
      tag(TagModel(id: args.id));
    }
  }

  fetchApis() {
    tagRepository.getById(tag().id).then(tag);
    songRepository.getTopSongsByTagId(tag().id).then(topSongs);
    songRepository.getLatestSongsByTagId(tag().id).then(latestSongs);
    artistRepository.getTopArtistsByTagId(tag().id).then(topArtists);
    albumRepository.getTopAlbumsByTagId(tag().id).then(topAlbums);
  }
}
