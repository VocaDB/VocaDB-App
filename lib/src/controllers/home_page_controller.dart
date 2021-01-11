import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class HomePageController extends GetxController {
  final highlighted = <SongModel>[].obs;
  final randomAlbums = <AlbumModel>[].obs;
  final recentAlbums = <AlbumModel>[].obs;
  final recentReleaseEvents = <ReleaseEventModel>[].obs;

  final SongRepository songRepository;
  final AlbumRepository albumRepository;
  final ReleaseEventRepository releaseEventRepository;

  HomePageController(
      {this.songRepository, this.albumRepository, this.releaseEventRepository});

  @override
  void onInit() {
    fetchApi();
    super.onInit();
  }

  fetchApi() {
    String lang = SharedPreferenceService.lang;
    songRepository.getHighlighted(lang: lang).then(highlighted);
    albumRepository.getTop(lang: lang).then(randomAlbums);
    albumRepository.getNew(lang: lang).then(recentAlbums);
    releaseEventRepository.getRecently(lang: lang).then(recentReleaseEvents);
  }
}
