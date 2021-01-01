import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/src/repositories/song_repository.dart';

class HomePageController extends GetxController {
  final highlighted = <SongModel>[].obs;

  final SongRepository songRepository;

  HomePageController({this.songRepository});

  @override
  void onInit() {
    fetchApi();
    super.onInit();
  }

  fetchApi() {
    songRepository.getHighlighted().then(updateHighlighted);
  }

  updateHighlighted(List<SongModel> songs) => highlighted(songs);
}
