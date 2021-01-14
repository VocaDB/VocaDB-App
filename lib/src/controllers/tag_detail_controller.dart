import 'package:get/get.dart';
import 'package:vocadb_app/arguments.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

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
    String lang = SharedPreferenceService.lang;
    tagRepository.getById(tag().id, lang: lang).then(tag);
    songRepository.getTopSongsByTagId(tag().id, lang: lang).then(topSongs);
    songRepository
        .getLatestSongsByTagId(tag().id, lang: lang)
        .then(latestSongs);
    artistRepository
        .getTopArtistsByTagId(tag().id, lang: lang)
        .then(topArtists);
    albumRepository.getTopAlbumsByTagId(tag().id, lang: lang).then(topAlbums);
  }
}
