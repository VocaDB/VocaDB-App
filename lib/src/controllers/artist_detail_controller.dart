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

  final AuthService authService;

  ArtistDetailController({this.artistRepository, this.authService});

  @override
  void onInit() {
    initArgs();
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
  }

  updateFollowArtist() {
    //TODO: Wait for API backend implementation
  }

  initialLoadingDone(_) => initialLoading(false);
}
