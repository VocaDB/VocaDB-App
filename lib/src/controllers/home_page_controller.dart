import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';

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
    songRepository.getHighlighted().then(highlighted);
    albumRepository.getTop().then(randomAlbums);
    albumRepository.getNew().then(recentAlbums);
    releaseEventRepository.getRecently().then(recentReleaseEvents);
  }
}
