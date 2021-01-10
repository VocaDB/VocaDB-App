import 'package:get/get.dart';
import 'package:vocadb_app/arguments.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SongDetailController extends GetxController {
  final initialLoading = true.obs;

  final song = SongModel().obs;

  final altSongs = <SongModel>[].obs;

  final relatedSongs = <SongModel>[].obs;

  final showLyric = false.obs;

  final liked = false.obs;

  final SongRepository songRepository;

  final UserRepository userRepository;

  final AuthService authService;

  YoutubePlayerController youtubeController;

  SongDetailController(
      {this.songRepository, this.userRepository, this.authService});

  @override
  void onInit() {
    initArgs();
    checkUserSongRating();
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
    songRepository.getById(song().id).then(song).then(initialLoadingDone);

    songRepository
        .getDerived(song().id)
        .then((songs) => songs.take(20).toList())
        .then(altSongs);

    songRepository
        .getRelated(song().id)
        .then((songs) => songs.take(20).toList())
        .then(relatedSongs);
  }

  checkUserSongRating() {
    int userId = authService.currentUser().id;

    if (userId == null) {
      return;
    }

    userRepository
        .getCurrentUserRatedSong(song().id)
        .then((value) => (value == 'Nothing') ? liked(false) : liked(true))
        .then((value) =>
            debounce(liked, (_) => updateRating(), time: Duration(seconds: 1)));
  }

  updateRating() => songRepository
      .rating(song().id, (liked.value) ? 'Like' : 'Nothing')
      .then((value) => Get.find<FavoriteSongController>())
      .then((c) => c.fetchApi())
      .catchError((err) => print(
          'favorite song controller not found. ignore fetch to refresh favorite songs'));

  initialLoadingDone(_) => initialLoading(false);
}
