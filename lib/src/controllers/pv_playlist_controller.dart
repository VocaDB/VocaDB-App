import 'package:get/get.dart';
import 'package:vocadb_app/arguments.dart';
import 'package:vocadb_app/models.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PVPlayListController extends GetxController {
  final songs = <SongModel>[].obs;

  final currentIndex = 0.obs;

  YoutubePlayerController youtubeController;

  PVPlayListController();

  @override
  void onInit() {
    initArgs();
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
    currentIndex(SongList(songs()).getFirstWithYoutubePVIndex(0));

    youtubeController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          songs()[currentIndex.toInt()].youtubePV.url),
      flags: YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  initArgs() {
    PVPlayListArgs args = Get.arguments;
    songs(args.songs);
  }

  onEnded() {
    this.next();
    youtubeController.load(YoutubePlayer.convertUrlToId(
        songs()[currentIndex.toInt()].youtubePV.url));
  }

  next() {
    int newIndex = currentIndex() + 1;

    if (newIndex >= songs().length) {
      newIndex = 0;
    }

    int nextPlayableIndex =
        SongList(songs()).getFirstWithYoutubePVIndex(newIndex);

    if (nextPlayableIndex == -1) {
      nextPlayableIndex = SongList(songs()).getFirstWithYoutubePVIndex(0);
    }

    currentIndex(newIndex);
  }

  onSelect(int index) {
    currentIndex(index);
    youtubeController
        .load(YoutubePlayer.convertUrlToId(songs()[index].youtubePV.url));
  }
}
