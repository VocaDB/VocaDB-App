import 'package:get/get.dart';
import 'package:vocadb_app/arguments.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class ArtistDetailController extends GetxController {
  final liked = false.obs;

  final initialLoading = true.obs;

  final artist = ArtistModel().obs;

  final ArtistRepository artistRepository;

  final UserRepository userRepository;

  final AuthService authService;

  ArtistDetailController(
      {this.artistRepository, this.authService, this.userRepository});

  @override
  void onInit() {
    initArgs();
    checkFollowArtistStatus();
    fetchApis();
    super.onInit();
  }

  initArgs() {
    ArtistDetailArgs args = Get.arguments;

    if (args.artist != null) {
      artist(args.artist);
    } else {
      artist(ArtistModel(id: args.id));
    }
  }

  fetchApis() => artistRepository
      .getById(artist().id, lang: SharedPreferenceService.lang)
      .then(artist)
      .then(initialLoadingDone);

  checkFollowArtistStatus() {
    int userId = authService.currentUser().id;

    if (userId == null) {
      return;
    }
    //TODO: Wait for API backend implementation

    userRepository.getCurrentUserFollowedArtist(artist().id).then((artist) {
      return (artist == null || artist.id == null) ? liked(false) : liked(true);
    }).then((artist) => debounce(liked, (_) => updateFollowArtist(),
        time: Duration(seconds: 1)));
  }

  updateFollowArtist() {
    //TODO: Wait for API backend implementation
  }

  initialLoadingDone(_) => initialLoading(false);
}
