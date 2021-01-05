import 'package:get/get.dart';
import 'package:vocadb_app/arguments.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SongDetailController extends GetxController {
  final song = SongModel().obs;

  final altSongs = <SongModel>[].obs;

  final relatedSongs = <SongModel>[].obs;

  final showLyric = false.obs;

  final SongRepository songRepository;

  YoutubePlayerController youtubeController;

  SongDetailController({this.songRepository});

  @override
  void onInit() {
    initArgs();
    fetchApis();
    initYoutubeController();
    super.onInit();
  }

  @override
  void onClose() {
    if (youtubeController != null) {
      youtubeController.dispose();
    }
    super.onClose();
  }

  initYoutubeController() {
    PVModel pv = song().youtubePV;

    if (pv == null) return;

    youtubeController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(pv.url),
      flags: YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  initArgs() {
    SongDetailArgs args = Get.arguments;

    if (args.song != null) {
      song(args.song);
    } else {
      song(SongModel(id: args.id));
    }
  }

  fetchApis() {
    songRepository.getById(song().id).then(song);

    songRepository
        .getDerived(song().id)
        .then((songs) => songs.take(20).toList())
        .then(altSongs);

    songRepository
        .getRelated(song().id)
        .then((songs) => songs.take(20).toList())
        .then(relatedSongs);
  }
}
